#!/usr/bin/env python3
"""Generate editor and terminal theme files from palette.json."""

import json
import os


class ThemeGenerator:
    """Generates all editor and terminal theme files from palette.json."""

    ROOT = os.path.dirname(os.path.abspath(__file__))
    ANSI_NAMES = ["black", "red", "green", "yellow", "blue", "magenta", "cyan", "white"]

    def __init__(self, variant="dark"):
        with open(os.path.join(self.ROOT, "palette.json")) as f:
            full = json.load(f)
        self.name = full["name"]
        self.variant = variant
        self.p = full[variant]
        self.bg = self.p["bg"]
        self.fg = self.p["fg"]
        self.s = self.p["syntax"]
        self.ui = self.p["ui"]
        self.d = self.p["diagnostic"]
        self.df = self.p["diff"]
        self.y = self.p["yellow"]
        self.h = self.p["headings"]
        self.st = self.p["statusline"]
        self.t = self.p["terminal"]
        self.g = self.p["gray"]
        self.x = self.p["extra"]

    @property
    def suffix(self):
        """File name suffix for non-default variants."""
        return "" if self.variant == "dark" else f"-{self.variant}"

    @property
    def label(self):
        """Human-readable variant label."""
        return f"{self.name} {'Dark' if self.variant == 'dark' else 'Light'}"

    @property
    def is_dark(self):
        return self.variant == "dark"

    # -- helpers -------------------------------------------------------------

    def write(self, relpath, content):
        path = os.path.join(self.ROOT, relpath)
        os.makedirs(os.path.dirname(path), exist_ok=True)
        with open(path, "w") as f:
            f.write(content)
        print(f"  wrote {relpath} ({content.count(chr(10))} lines)")

    @property
    def ansi_normal(self):
        return [self.t[n] for n in self.ANSI_NAMES]

    @property
    def ansi_bright(self):
        return [self.t[f"bright_{n}"] for n in self.ANSI_NAMES]

    def _vim_hi(self, group, fg="", bg="", style="NONE"):
        parts = [f"hi {group}"]
        if fg: parts.append(f"guifg={fg}")
        if bg: parts.append(f"guibg={bg}")
        parts.append(f"gui={style}")
        return "  " + " ".join(parts)

    # -- lua palette ---------------------------------------------------------

    def lua_palette(self):
        s, bg, fg, d = self.s, self.bg, self.fg, self.d
        df, y, ui, g, x = self.df, self.y, self.ui, self.g, self.x

        m = {
            "bg": bg["base"], "bg1": bg["raised"], "bg2": bg["surface"],
            "bg3": bg["overlay"], "bg4": bg["muted"], "bg5": bg["accent"],
            "fg": fg["base"],
            "blue": s["keyword"], "purple": s["function"], "teal": s["comment"],
            "aqua": s["string"], "pink": s["exception"], "red": d["error"],
            "soft_pink": s["number"], "magenta": s["define"],
            "light_purple": s["macro"], "violet": s["label"],
            "lavender": s["precondit"], "pale_purple": fg["muted"],
            "lilac": s["float"], "mint": s["delimiter"],
            "steel_blue": s["specialchar"], "light_blue": s["operator"],
            "blue_gray": ui["directory"], "cyan_blue": ui["search"],
            "yellow": y["base"], "light_yellow": y["light"],
            "dark_yellow": y["dark"], "bright_yellow": y["bright"],
            "warning": d["warning"], "tan": x["tan"],
            "deep_purple": s["boolean"], "bright_pink": s["character"],
            "magenta_pink": s["tag"], "bright_magenta": x["bright_magenta"],
            "bright_purple": x["bright_purple"], "hot_magenta": x["hot_magenta"],
            "deep_pink_alt": x["deep_pink_alt"], "lime": x["lime"],
            "bright_lime": x["bright_lime"], "pure_green": x["pure_green"],
            "dark_green": s["identifier"], "green_obj": x["green_obj"],
            "green_param": x["green_param"],
            "pale_pink": s["debug"],
            "gray1": g["1"], "gray2": g["2"], "gray3": g["3"], "gray4": g["4"],
            "white1": fg["white"], "white2": fg["bright"],
            "white3": x["white3"], "off_white": x["off_white"],
            "muted_purple": ui["folded"], "tab_gray": x["tab_gray"],
            "medium_purple": x["medium_purple"], "dark_red": x["dark_red"],
            "dark_blue": x["dark_blue"], "light_mauve": s["property"],
            "blue_constant": s["constant"], "blue_easymotion": x["blue_easymotion"],
            "dark_orange": x["dark_orange"], "very_pale": x["very_pale"],
            "slate_blue": x["slate_blue"], "maroon": x["maroon"],
            "purple_param": x["purple_param"], "pale_lavender": x["pale_lavender"],
            "icy_blue": x["icy_blue"],
            "selection": ui["selection"],
            "linenr_fg": ui["linenr"], "nontext": ui["nontext"],
            "ignore": fg["invisible"], "specialkey": ui["nontext"],
            "wildmenu_fg": ui["wildmenu"],
            "none": "NONE",
        }

        lines = [
            f"-- Generated from palette.json ({self.variant}) — do not edit by hand.",
            "-- Run: python3 generate.py",
            "local M = {}", "",
        ]
        for key, val in m.items():
            lines.append(f"M.{key} = '{val}'")
        lines += ["", "return M", ""]
        fname = "palette" if self.is_dark else "palette_light"
        self.write(f"lua/fluidlan/{fname}.lua", "\n".join(lines))

    # -- vim -----------------------------------------------------------------

    def vim(self):
        hi = self._vim_hi
        s, bg, fg, d = self.s, self.bg, self.fg, self.d
        df, y, ui, st, h = self.df, self.y, self.ui, self.st, self.h

        bg_mode = "dark" if self.is_dark else "light"
        nvim_cmd = 'require("fluidlan").load()' if self.is_dark else 'require("fluidlan").load_light()'
        colorscheme_name = "fluidlan" if self.is_dark else "fluidlan-light"
        lines = [
            '" Vim color file',
            '" Author: Jackson Holiday Wheeler',
            '" URL: https://github.com/jhwheeler/fluidlan-theme',
            f'" Generated from palette.json ({self.variant}) — do not edit by hand.',
            '" Run: python3 generate.py', '',
            'if has("nvim")',
            f'  lua {nvim_cmd}',
            '  finish',
            'endif', '',
            f'set background={bg_mode}', 'hi clear',
            'if exists("syntax_on")', '  syntax reset', 'endif',
            f'let g:colors_name = "{colorscheme_name}"', '',
            '" Editor UI',
            hi("Normal", fg["base"], "NONE"),
            hi("Cursor", bg["raised"], ui["cursor"], "bold"),
            hi("LineNr", ui["linenr"]),
            hi("CursorLine", "", bg["surface"]),
            hi("CursorLineNr", s["function"], bg["surface"]),
            hi("CursorColumn", "", bg["surface"]),
            hi("ColorColumn", "", bg["surface"]),
            hi("StatusLine", st["fg"], st["bg"]),
            hi("StatusLineNC", st["nc_fg"], st["nc_bg"]),
            hi("WinSeparator", bg["surface"]),
            hi("VertSplit", bg["surface"]),
            hi("TabLine", "#5f8787", bg["muted"]),
            hi("TabLineSel", y["base"], bg["accent"]),
            hi("TabLineFill", "#afafaf", bg["overlay"]),
            hi("WildMenu", ui["wildmenu"], bg["muted"]),
            hi("Pmenu", fg["muted"], bg["raised"]),
            hi("PmenuSel", fg["white"], "#875faf"),
            hi("PmenuSbar", "#a478d4", bg["surface"]),
            hi("PmenuThumb", d["error"], "#875faf"),
            hi("SignColumn", s["string"]),
            hi("FoldColumn", ui["directory"], bg["raised"]),
            hi("Folded", "#af5faf", bg["raised"], "bold"),
            hi("Search", bg["base"], ui["search"], "bold"),
            hi("IncSearch", fg["bright"], ui["search"], "bold"),
            hi("MatchParen", fg["bright"], "", "bold,underline"),
            hi("ModeMsg", s["comment"]), hi("MoreMsg", s["comment"]),
            hi("Question", p["light_purple"]),
            hi("Visual", "", ui["selection"]),
            hi("VisualNOS", "", ui["selection"]),
            hi("NonText", ui["nontext"]),
            hi("Todo", y["dark"], "", "bold"),
            hi("Warning", d["warning"], "", "bold"),
            hi("WarningMsg", d["warning"], "", "bold"),
            hi("Error", d["error"], "", "bold"),
            hi("ErrorMsg", d["error"], "", "bold"), '',
            '" Syntax',
            hi("Boolean", s["boolean"]), hi("Character", s["character"]),
            hi("Number", s["number"]), hi("Float", s["float"]),
            hi("String", s["string"]),
            hi("Conditional", s["keyword"], "", "bold"),
            hi("Constant", s["constant"]),
            hi("Debug", s["debug"]), hi("Define", s["define"]),
            hi("Delimiter", s["delimiter"]),
            hi("Exception", s["exception"], "", "bold"),
            hi("Function", s["function"], "", "bold"),
            hi("Identifier", s["identifier"]),
            hi("Ignore", fg["invisible"]),
            hi("Operator", s["operator"]),
            hi("PreCondit", s["precondit"]), hi("PreProc", s["preproc"]),
            hi("Directory", ui["directory"], "", "bold"),
            hi("Repeat", s["keyword"], "", "bold"),
            hi("Keyword", s["keyword"], "", "bold"),
            hi("Statement", s["keyword"]),
            hi("Structure", s["keyword"], "", "bold"),
            hi("Label", s["label"]), hi("Macro", s["macro"]),
            hi("Type", s["type"]), hi("Typedef", s["type"]),
            '  hi Underlined gui=underline',
            hi("StorageClass", s["keyword"], "", "bold"),
            hi("Comment", s["comment"], "", "italic"),
            hi("Special", s["special"]),
            hi("SpecialKey", ui["nontext"]),
            hi("SpecialChar", s["specialchar"], "", "bold"),
            hi("SpecialComment", "#65737e"),
            hi("Tag", s["tag"]), hi("Title", s["number"]),
            hi("SpellBad", s["exception"], "#5f0000", "undercurl"),
            hi("SpellCap", "#87afd7", "#005faf", "undercurl"),
            hi("SpellLocal", "#dadada", "", "undercurl"),
            hi("SpellRare", "#c2b088", "", "undercurl"),
            hi("diffAdded", df["added"]), hi("diffRemoved", df["removed"]),
            '  hi link qfLineNr Type', '',
            '" Markdown',
            hi("markdownH1", h["h1"], "", "bold"),
            hi("markdownH2", h["h2"], "", "bold"),
            hi("markdownH3", h["h3"], "", "bold"),
            hi("markdownH4", h["h4"], "", "bold"),
            hi("markdownH5", h["h5"]), hi("markdownH6", h["h6"]),
            hi("mkdCode", s["string"]),
            hi("mkdItalic", s["string"], "", "italic"), '',
            '" HTML',
            '  hi link htmlSpecialTagName Tag',
            hi("htmlItalic", s["string"], "", "italic"),
            '  hi htmlBold gui=bold',
            hi("htmlH1", h["h1"], "", "bold"),
            hi("htmlH2", h["h2"], "", "bold"),
            hi("htmlH3", h["h3"], "", "bold"),
            hi("htmlH4", h["h4"], "", "bold"),
            hi("htmlH5", h["h5"]), hi("htmlH6", h["h6"]), '',
            '" CSS',
            hi("cssTagName", s["keyword"], "", "bold"),
            hi("cssProp", s["property"]),
            hi("cssClassName", s["keyword"]),
            hi("cssIdentifier", s["keyword"]),
            hi("cssPseudoClassId", s["precondit"]),
            hi("cssColor", s["string"]), '',
            '" JavaScript',
            hi("jsReturn", s["keyword"], "", "bold"),
            '  hi link jsObjectKey Type',
            '  hi link jsFuncBlock Identifier',
            '  hi link jsVariableDef Title', '',
            '" Git gutter / Signify',
            hi("GitGutterAdd", df["added"]),
            hi("GitGutterChange", df["changed"]),
            hi("GitGutterDelete", d["error"]),
            hi("GitGutterChangeDelete", s["macro"]),
            hi("SignifySignAdd", df["added"]),
            hi("SignifySignChange", df["changed"]),
            hi("SignifySignDelete", d["error"]),
            hi("SignifySignChangeDelete", s["macro"]), '',
            '" ALE',
            '  hi link ALEErrorSign Error',
            '  hi link ALEWarningSign Warning',
        ]
        self.write(f"colors/fluidlan{self.suffix}.vim", "\n".join(lines) + "\n")

    # -- helix ---------------------------------------------------------------

    def helix(self):
        s, bg, fg, d = self.s, self.bg, self.fg, self.d
        df, y, ui, st, h = self.df, self.y, self.ui, self.st, self.h

        lines = [
            f'# {self.label} — Helix theme',
            '# Generated from palette.json — do not edit by hand.', '',
            '# UI',
            f'"ui.background" = {{ bg = "{bg["base"]}" }}',
            f'"ui.text" = "{fg["base"]}"',
            f'"ui.text.focus" = "{fg["bright"]}"',
            f'"ui.text.inactive" = "{fg["muted"]}"',
            f'"ui.text.info" = "{d["info"]}"',
            f'"ui.text.directory" = {{ fg = "{ui["directory"]}", modifiers = ["bold"] }}',
            f'"ui.cursor" = {{ fg = "{bg["base"]}", bg = "{ui["cursor"]}" }}',
            f'"ui.cursor.match" = {{ fg = "{fg["bright"]}", modifiers = ["bold", "underlined"] }}',
            f'"ui.cursor.insert" = {{ fg = "{bg["base"]}", bg = "{s["string"]}" }}',
            f'"ui.cursor.select" = {{ fg = "{bg["base"]}", bg = "{s["function"]}" }}',
            f'"ui.cursorline.primary" = {{ bg = "{bg["surface"]}" }}',
            f'"ui.linenr" = "{ui["linenr"]}"',
            f'"ui.linenr.selected" = "{s["function"]}"',
            f'"ui.statusline" = {{ fg = "{st["fg"]}", bg = "{st["bg"]}" }}',
            f'"ui.statusline.inactive" = {{ fg = "{st["nc_fg"]}", bg = "{st["nc_bg"]}" }}',
            f'"ui.statusline.normal" = {{ fg = "{bg["base"]}", bg = "{s["keyword"]}" }}',
            f'"ui.statusline.insert" = {{ fg = "{bg["base"]}", bg = "{s["string"]}" }}',
            f'"ui.statusline.select" = {{ fg = "{bg["base"]}", bg = "{s["function"]}" }}',
            f'"ui.bufferline" = {{ fg = "{st["nc_fg"]}", bg = "{bg["overlay"]}" }}',
            f'"ui.bufferline.active" = {{ fg = "{y["base"]}", bg = "{bg["accent"]}" }}',
            f'"ui.bufferline.background" = {{ bg = "{bg["raised"]}" }}',
            f'"ui.popup" = {{ fg = "{fg["muted"]}", bg = "{bg["raised"]}" }}',
            f'"ui.popup.info" = {{ fg = "{fg["base"]}", bg = "{bg["overlay"]}" }}',
            f'"ui.menu" = {{ fg = "{fg["muted"]}", bg = "{bg["raised"]}" }}',
            f'"ui.menu.selected" = {{ fg = "{fg["white"]}", bg = "#875faf" }}',
            f'"ui.menu.scroll" = {{ fg = "#a478d4", bg = "{bg["surface"]}" }}',
            f'"ui.selection" = {{ bg = "{ui["selection"]}" }}',
            f'"ui.selection.primary" = {{ bg = "{bg["accent"]}" }}',
            f'"ui.window" = "{bg["surface"]}"',
            f'"ui.help" = {{ fg = "{fg["base"]}", bg = "{bg["raised"]}" }}',
            f'"ui.virtual.ruler" = {{ bg = "{bg["surface"]}" }}',
            f'"ui.virtual.whitespace" = "{ui["nontext"]}"',
            f'"ui.virtual.indent-guide" = "{bg["overlay"]}"',
            f'"ui.virtual.inlay-hint" = {{ fg = "#65737e", modifiers = ["italic"] }}',
            f'"ui.virtual.jump-label" = {{ fg = "{bg["base"]}", bg = "{s["function"]}", modifiers = ["bold"] }}', '',
            '# Diagnostics',
            f'"warning" = "{d["warning"]}"', f'"error" = "{d["error"]}"',
            f'"info" = "{d["info"]}"', f'"hint" = "{d["hint"]}"',
            f'"diagnostic.warning" = {{ underline = {{ color = "{d["warning"]}", style = "curl" }} }}',
            f'"diagnostic.error" = {{ underline = {{ color = "{d["error"]}", style = "curl" }} }}',
            f'"diagnostic.info" = {{ underline = {{ color = "{d["info"]}", style = "curl" }} }}',
            f'"diagnostic.hint" = {{ underline = {{ color = "{d["hint"]}", style = "curl" }} }}', '',
            '# Diff',
            f'"diff.plus" = "{df["added"]}"', f'"diff.minus" = "{df["removed"]}"',
            f'"diff.delta" = "{df["changed"]}"',
            f'"diff.plus.gutter" = "{df["added"]}"',
            f'"diff.minus.gutter" = "{df["removed"]}"',
            f'"diff.delta.gutter" = "{df["changed"]}"', '',
            '# Syntax',
            f'"keyword" = {{ fg = "{s["keyword"]}", modifiers = ["bold"] }}',
            f'"keyword.control.conditional" = {{ fg = "{s["keyword"]}", modifiers = ["bold"] }}',
            f'"keyword.control.repeat" = {{ fg = "{s["keyword"]}", modifiers = ["bold"] }}',
            f'"keyword.control.import" = "{s["preproc"]}"',
            f'"keyword.control.return" = {{ fg = "{s["keyword"]}", modifiers = ["bold"] }}',
            f'"keyword.control.exception" = {{ fg = "{s["exception"]}", modifiers = ["bold"] }}',
            f'"keyword.operator" = "{s["operator"]}"',
            f'"keyword.function" = {{ fg = "{s["keyword"]}", modifiers = ["bold"] }}',
            f'"keyword.storage" = {{ fg = "{s["keyword"]}", modifiers = ["bold"] }}',
            f'"keyword.storage.type" = "{s["keyword"]}"',
            f'"keyword.storage.modifier" = {{ fg = "{s["keyword"]}", modifiers = ["bold"] }}',
            f'"function" = {{ fg = "{s["function"]}", modifiers = ["bold"] }}',
            f'"function.builtin" = {{ fg = "{s["function"]}", modifiers = ["bold"] }}',
            f'"function.method" = {{ fg = "{s["function"]}", modifiers = ["bold"] }}',
            f'"function.macro" = "{s["macro"]}"',
            f'"type" = "{s["type"]}"', f'"type.builtin" = "{s["type"]}"',
            f'"type.enum.variant" = "{s["constant"]}"',
            f'"constructor" = "{y["base"]}"',
            f'"variable" = "{fg["base"]}"',
            f'"variable.builtin" = {{ fg = "{s["keyword"]}", modifiers = ["bold"] }}',
            f'"variable.parameter" = "{s["identifier"]}"',
            f'"variable.other.member" = "{s["property"]}"',
            f'"constant" = "{s["constant"]}"',
            f'"constant.builtin" = "{s["constant"]}"',
            f'"constant.builtin.boolean" = "{s["boolean"]}"',
            f'"constant.character" = "{s["character"]}"',
            f'"constant.character.escape" = {{ fg = "{s["specialchar"]}", modifiers = ["bold"] }}',
            f'"constant.numeric" = "{s["number"]}"',
            f'"constant.numeric.integer" = "{s["number"]}"',
            f'"constant.numeric.float" = "{s["float"]}"',
            f'"string" = "{s["string"]}"',
            f'"string.regexp" = "{s["specialchar"]}"',
            f'"string.special" = "{s["specialchar"]}"',
            f'"comment" = {{ fg = "{s["comment"]}", modifiers = ["italic"] }}',
            f'"comment.line.documentation" = {{ fg = "{s["comment"]}", modifiers = ["italic"] }}',
            f'"operator" = "{s["operator"]}"',
            f'"punctuation" = "{s["delimiter"]}"',
            f'"punctuation.delimiter" = "{s["delimiter"]}"',
            f'"punctuation.bracket" = "{s["delimiter"]}"',
            f'"punctuation.special" = "{s["specialchar"]}"',
            f'"namespace" = "{s["precondit"]}"',
            f'"label" = "{s["label"]}"', f'"tag" = "{s["tag"]}"',
            f'"attribute" = "{s["identifier"]}"',
            f'"special" = "{s["special"]}"', '',
            '# Markup',
            f'"markup.heading.1" = {{ fg = "{h["h1"]}", modifiers = ["bold"] }}',
            f'"markup.heading.2" = {{ fg = "{h["h2"]}", modifiers = ["bold"] }}',
            f'"markup.heading.3" = {{ fg = "{h["h3"]}", modifiers = ["bold"] }}',
            f'"markup.heading.4" = {{ fg = "{h["h4"]}", modifiers = ["bold"] }}',
            f'"markup.heading.5" = "{h["h5"]}"', f'"markup.heading.6" = "{h["h6"]}"',
            f'"markup.bold" = {{ modifiers = ["bold"] }}',
            f'"markup.italic" = {{ fg = "{s["string"]}", modifiers = ["italic"] }}',
            f'"markup.raw" = "{s["string"]}"',
            f'"markup.raw.inline" = "{s["string"]}"',
            f'"markup.raw.block" = "{s["string"]}"',
            f'"markup.link.url" = {{ fg = "{s["comment"]}", modifiers = ["underlined"] }}',
            f'"markup.link.text" = {{ fg = "{s["function"]}", modifiers = ["underlined"] }}',
            f'"markup.quote" = {{ fg = "{s["comment"]}", modifiers = ["italic"] }}',
        ]
        self.write(f"editors/helix/fluidlan{self.suffix}.toml", "\n".join(lines) + "\n")

    # -- zed -----------------------------------------------------------------

    def zed(self):
        s, bg, fg, d = self.s, self.bg, self.fg, self.d
        df, y, ui, st = self.df, self.y, self.ui, self.st
        normal, bright = self.ansi_normal, self.ansi_bright

        theme = {
            "$schema": "https://zed.dev/schema/themes/v0.2.0.json",
            "name": "Fluidlan", "author": "Jackson Holiday Wheeler",
            "themes": [{
                "name": self.label, "appearance": self.variant,
                "style": {
                    "background": bg["base"],
                    "surface.background": bg["raised"],
                    "elevated_surface.background": bg["overlay"],
                    "panel.background": bg["raised"],
                    "editor.background": bg["base"],
                    "editor.foreground": fg["base"],
                    "editor.gutter.background": bg["base"],
                    "editor.line_number": fg["subtle"],
                    "editor.active_line_number": s["function"],
                    "editor.active_line.background": bg["surface"],
                    "editor.invisible": fg["faint"],
                    "editor.wrap_guide": bg["overlay"],
                    "editor.document_highlight.read_background": bg["overlay"],
                    "editor.document_highlight.write_background": bg["overlay"],
                    "search.match_background": ui["search"] + "44",
                    "border": bg["overlay"], "border.variant": bg["muted"],
                    "border.focused": s["function"], "border.selected": s["function"],
                    "text": fg["base"], "text.muted": fg["muted"],
                    "text.placeholder": fg["subtle"], "text.disabled": fg["faint"],
                    "text.accent": s["function"],
                    "icon": fg["base"], "icon.muted": fg["muted"],
                    "element.background": bg["overlay"],
                    "element.hover": bg["muted"],
                    "element.active": bg["accent"],
                    "element.selected": bg["accent"],
                    "ghost_element.hover": bg["overlay"],
                    "ghost_element.active": bg["muted"],
                    "ghost_element.selected": bg["muted"],
                    "tab_bar.background": bg["raised"],
                    "tab.active_background": bg["base"],
                    "tab.inactive_background": bg["raised"],
                    "toolbar.background": bg["base"],
                    "status_bar.background": st["bg"],
                    "title_bar.background": bg["base"],
                    "title_bar.inactive_background": bg["raised"],
                    "scrollbar.thumb.background": bg["accent"] + "50",
                    "scrollbar.thumb.hover_background": bg["accent"] + "80",
                    "scrollbar.track.background": bg["base"],
                    "error": d["error"], "error.background": d["error"] + "18",
                    "warning": d["warning"], "warning.background": d["warning"] + "18",
                    "info": d["info"], "hint": d["hint"], "success": d["ok"],
                    "created": df["added"], "modified": df["changed"],
                    "deleted": df["removed"], "conflict": s["exception"],
                    "hidden": fg["faint"], "ignored": fg["invisible"],
                    "link_text.hover": s["comment"],
                    "terminal.background": bg["base"],
                    "terminal.foreground": fg["base"],
                    **{f"terminal.ansi.{n}": c for n, c in zip(self.ANSI_NAMES, normal)},
                    **{f"terminal.ansi.bright_{n}": c for n, c in zip(self.ANSI_NAMES, bright)},
                    "players": [
                        {"cursor": s["function"], "background": s["function"], "selection": bg["muted"]},
                        {"cursor": s["string"], "background": s["string"], "selection": bg["muted"]},
                    ],
                    "syntax": {
                        "keyword": {"color": s["keyword"], "font_weight": 700},
                        "function": {"color": s["function"], "font_weight": 700},
                        "comment": {"color": s["comment"], "font_style": "italic"},
                        "comment.doc": {"color": s["comment"], "font_style": "italic"},
                        "string": {"color": s["string"]},
                        "string.escape": {"color": s["specialchar"], "font_weight": 700},
                        "string.regex": {"color": s["specialchar"]},
                        "string.special": {"color": s["specialchar"]},
                        "number": {"color": s["number"]},
                        "boolean": {"color": s["boolean"]},
                        "constant": {"color": s["constant"]},
                        "type": {"color": s["type"]},
                        "constructor": {"color": y["base"]},
                        "variable": {"color": fg["base"]},
                        "variable.special": {"color": s["keyword"], "font_weight": 700},
                        "property": {"color": s["property"]},
                        "operator": {"color": s["operator"]},
                        "punctuation": {"color": s["delimiter"]},
                        "punctuation.bracket": {"color": s["delimiter"]},
                        "punctuation.delimiter": {"color": s["delimiter"]},
                        "punctuation.special": {"color": s["specialchar"]},
                        "tag": {"color": s["tag"]},
                        "attribute": {"color": s["identifier"]},
                        "namespace": {"color": s["precondit"]},
                        "label": {"color": s["label"]},
                        "preproc": {"color": s["preproc"]},
                        "emphasis": {"font_style": "italic"},
                        "emphasis.strong": {"font_weight": 700},
                        "title": {"color": s["keyword"], "font_weight": 700},
                        "text.literal": {"color": s["string"]},
                        "link_text": {"color": s["function"]},
                        "link_uri": {"color": s["comment"]},
                        "enum": {"color": s["type"]},
                        "variant": {"color": s["constant"]},
                    },
                },
            }],
        }
        self.write(f"editors/zed/fluidlan{self.suffix}.json", json.dumps(theme, indent=2) + "\n")

    # -- terminals -----------------------------------------------------------

    def alacritty(self):
        bg, fg, ui, s = self.bg, self.fg, self.ui, self.s
        lines = [
            f'# {self.label} — Alacritty theme',
            '# Generated from palette.json — do not edit by hand.', '',
            '[colors.primary]',
            f'background = "{bg["base"]}"', f'foreground = "{fg["base"]}"',
            f'bright_foreground = "{fg["bright"]}"', '',
            '[colors.cursor]',
            f'text = "{bg["base"]}"', f'cursor = "{ui["cursor"]}"', '',
            '[colors.vi_mode_cursor]',
            f'text = "{bg["base"]}"', f'cursor = "{ui["cursor"]}"', '',
            '[colors.search.matches]',
            f'foreground = "{bg["base"]}"', f'background = "{ui["search"]}"', '',
            '[colors.search.focused_match]',
            f'foreground = "{bg["base"]}"', f'background = "{s["string"]}"', '',
            '[colors.selection]',
            'text = "CellForeground"', f'background = "{ui["selection"]}"', '',
            '[colors.normal]',
        ]
        for n, c in zip(self.ANSI_NAMES, self.ansi_normal):
            lines.append(f'{n} = "{c}"')
        lines += ['', '[colors.bright]']
        for n, c in zip(self.ANSI_NAMES, self.ansi_bright):
            lines.append(f'{n} = "{c}"')
        lines.append('')
        self.write(f"terminals/alacritty/fluidlan{self.suffix}.toml", "\n".join(lines) + "\n")

    def kitty(self):
        bg, fg, ui, s, st = self.bg, self.fg, self.ui, self.s, self.st
        lines = [
            f'# {self.label} — Kitty theme',
            '# Generated from palette.json — do not edit by hand.', '',
            f'foreground {fg["base"]}', f'background {bg["base"]}', '',
            f'cursor {ui["cursor"]}', f'cursor_text_color {bg["base"]}', '',
            f'selection_foreground none',
            f'selection_background {ui["selection"]}', '',
            f'url_color {s["keyword"]}', '',
            f'active_border_color {s["function"]}',
            f'inactive_border_color {bg["accent"]}', '',
            f'active_tab_foreground   {bg["base"]}',
            f'active_tab_background   {s["function"]}',
            f'inactive_tab_foreground {fg["base"]}',
            f'inactive_tab_background {st["bg"]}',
            f'tab_bar_background      {bg["raised"]}', '',
        ]
        for i, c in enumerate(self.ansi_normal + self.ansi_bright):
            lines.append(f'color{i} {c}')
        lines.append('')
        self.write(f"terminals/kitty/fluidlan{self.suffix}.conf", "\n".join(lines) + "\n")

    def tmux(self):
        bg, fg, ui, s, st, d = self.bg, self.fg, self.ui, self.s, self.st, self.d
        non_selected_fg = fg["white"] if self.is_dark else st["nc_fg"]
        lines = [
            f'# {self.label} — tmux theme',
            '# Generated from palette.json — do not edit by hand.',
            '# Run: source-file /path/to/fluidlan.conf', '',
            '# Core bar',
            f'set -g status-style "bg={st["bg"]},fg={st["fg"]}"',
            f'set -g status-interval 1',
            f'set -g status-left-length 80',
            f'set -g status-right-length 120',
            f'set -g status-left "#[fg={s["keyword"]}]Sessions: #(~/.tmux/scripts/sessions.sh)#[fg={fg["muted"]}]│ #[fg={s["keyword"]}]Windows: "',
            'set -g status-left-length 60',
            f'set -g status-right "#[fg={s["function"]}]%H:%M:%S #[fg={fg["white"]}]W%V #[fg={s["keyword"]}]%a %Y-%m-%d"',
            '',
            '# Window styles',
            f'set -g window-status-current-format " #I:#W "',
            f'set -g window-status-current-style "fg={s["function"]},bold"',
            f'set -g window-status-format " #I:#W "',
            f'set -g window-status-style "fg={non_selected_fg}"',
            f'set -g window-status-activity-style "fg={d["warning"]},bg={bg["base"]},bold"',
            f'set -g window-status-bell-style "fg={d["error"]},bg={bg["base"]},bold"',
            'set -g window-status-separator ""',
            '',
            '# Pane / copy / popup styles',
            f'set -g pane-border-style "fg={bg["muted"]}"',
            f'set -g pane-active-border-style "fg={s["function"]}"',
            f'set -g display-panes-colour "{s["keyword"]}"',
            f'set -g display-panes-active-colour "{ui["cursor"]}"',
            f'set -g copy-mode-match-style "bg={s["keyword"]},fg={bg["base"]},bold"',
            f'set -g copy-mode-current-match-style "bg={s["string"]},fg={bg["base"]},bold"',
            f'set -g copy-mode-mark-style "bg={d["error"]},fg={bg["base"]}"',
            '',
            '# Command and mode styles',
            f'set -g message-style "bg={ui["search"]},fg={bg["base"]}"',
            f'set -g message-command-style "bg={ui["cursor"]},fg={bg["base"]}"',
            f'set -g mode-style "bg={s["keyword"]},fg={bg["base"]}"',
            '',
            '# Misc',
            f'set -g clock-mode-colour "{s["keyword"]}"',
            ''
        ]
        self.write(f"terminals/tmux/fluidlan{self.suffix}.conf", "\n".join(lines) + "\n")

    def wezterm(self):
        bg, fg, ui, st = self.bg, self.fg, self.ui, self.st
        n = ", ".join(f'"{c}"' for c in self.ansi_normal)
        b = ", ".join(f'"{c}"' for c in self.ansi_bright)
        lines = [
            f'# {self.label} — WezTerm theme',
            '# Generated from palette.json — do not edit by hand.', '',
            '[metadata]', f'name = "{self.label}"',
            'origin_url = "https://github.com/jhwheeler/fluidlan-theme"', '',
            '[colors]',
            f'foreground = "{fg["base"]}"', f'background = "{bg["base"]}"',
            f'cursor_bg = "{ui["cursor"]}"', f'cursor_fg = "{bg["base"]}"',
            f'cursor_border = "{ui["cursor"]}"',
            f'selection_fg = "none"', f'selection_bg = "{ui["selection"]}"',
            f'scrollbar_thumb = "{bg["accent"]}"',
            f'split = "{bg["surface"]}"', f'compose_cursor = "{ui["cursor"]}"', '',
            f'ansi = [{n}]', f'brights = [{b}]', '',
            '[colors.tab_bar]',
            f'background = "{bg["raised"]}"',
            f'inactive_tab_edge = "{bg["overlay"]}"', '',
            '[colors.tab_bar.active_tab]',
            f'bg_color = "{st["bg"]}"', f'fg_color = "{st["fg"]}"', '',
            '[colors.tab_bar.inactive_tab]',
            f'bg_color = "{bg["raised"]}"', f'fg_color = "{st["nc_fg"]}"', '',
            '[colors.tab_bar.new_tab]',
            f'bg_color = "{bg["base"]}"', f'fg_color = "{fg["base"]}"', '',
        ]
        self.write(f"terminals/wezterm/fluidlan{self.suffix}.toml", "\n".join(lines) + "\n")

    def windows_terminal(self):
        bg, fg, ui = self.bg, self.fg, self.ui
        normal, bright = self.ansi_normal, self.ansi_bright
        scheme = {
            "name": self.label,
            "background": bg["base"], "foreground": fg["base"],
            "cursorColor": ui["cursor"], "selectionBackground": ui["selection"],
            "black": normal[0], "red": normal[1], "green": normal[2],
            "yellow": normal[3], "blue": normal[4], "purple": normal[5],
            "cyan": normal[6], "white": normal[7],
            "brightBlack": bright[0], "brightRed": bright[1],
            "brightGreen": bright[2], "brightYellow": bright[3],
            "brightBlue": bright[4], "brightPurple": bright[5],
            "brightCyan": bright[6], "brightWhite": bright[7],
        }
        self.write(f"terminals/windows-terminal/fluidlan{self.suffix}.json",
                    json.dumps(scheme, indent=2) + "\n")

    def ghostty(self):
        bg, fg, ui = self.bg, self.fg, self.ui
        lines = [
            f'# {self.label} — Ghostty theme',
            '# Generated from palette.json — do not edit by hand.', '',
            f'background = {bg["base"]}', f'foreground = {fg["base"]}', '',
            f'cursor-color = {ui["cursor"]}', f'cursor-text = {bg["base"]}', '',
            f'selection-background = {ui["selection"]}',
            f'selection-foreground = {fg["base"]}', '',
        ]
        for i, c in enumerate(self.ansi_normal + self.ansi_bright):
            lines.append(f'palette = {i}={c}')
        lines.append('')
        self.write(f"terminals/ghostty/fluidlan{self.suffix}", "\n".join(lines) + "\n")

    # -- run all -------------------------------------------------------------

    def generate_all(self):
        print("Generating from palette.json...")
        self.lua_palette()
        self.vim()
        self.helix()
        self.zed()
        self.alacritty()
        self.kitty()
        self.tmux()
        self.wezterm()
        self.windows_terminal()
        self.ghostty()
        print("Done.")


if __name__ == "__main__":
    for variant in ("dark", "light"):
        ThemeGenerator(variant).generate_all()
