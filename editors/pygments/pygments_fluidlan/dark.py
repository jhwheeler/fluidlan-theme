"""Fluidlan Dark — Pygments style.

Generated from palette.json — do not edit by hand.
Run: python3 generate.py
"""

from pygments.style import Style
from pygments.token import Comment, Error, Generic, Keyword, Literal, Name, Number, Operator, Punctuation, String, Token


class FluidlanStyle(Style):
    name = "fluidlan"
    background_color = "#212026"
    highlight_color = "#444060"

    styles = {
        Token:                   "#b4b7bd",
        Comment:                 "italic #2aa1ae",
        Comment.Preproc:         "#E697E6",
        Comment.PreprocFile:     "#d698fe",
        Comment.Special:         "bold italic #2aa1ae",
        Keyword:                 "bold #4f97d7",
        Keyword.Constant:        "#8787ff",
        Keyword.Declaration:     "bold #4f97d7",
        Keyword.Namespace:       "bold #b888e2",
        Keyword.Pseudo:          "#df90ff",
        Keyword.Reserved:        "bold #4f97d7",
        Keyword.Type:            "#4f97d7",
        Name:                    "#b4b7bd",
        Name.Attribute:          "#87afd7",
        Name.Builtin:            "#bc6ec5",
        Name.Builtin.Pseudo:     "#8787ff",
        Name.Class:              "bold #4f97d7",
        Name.Constant:           "#8787ff",
        Name.Decorator:          "#b888e2",
        Name.Entity:             "#df90ff",
        Name.Exception:          "bold #b56777",
        Name.Function:           "#bc6ec5",
        Name.Function.Magic:     "#bc6ec5",
        Name.Label:              "#df90ff",
        Name.Namespace:          "#4f97d7",
        Name.Other:              "#35b07c",
        Name.Property:           "#87afd7",
        Name.Tag:                "#ca78e8",
        Name.Variable:           "#35b07c",
        Name.Variable.Class:     "#35b07c",
        Name.Variable.Global:    "#35b07c",
        Name.Variable.Instance:  "#35b07c",
        Name.Variable.Magic:     "#df90ff",
        Literal:                 "#E697E6",
        Literal.Date:            "#20af81",
        String:                  "#20af81",
        String.Affix:            "#20af81",
        String.Backtick:         "#20af81",
        String.Char:             "#d572a4",
        String.Delimiter:        "#5cbcac",
        String.Doc:              "italic #2aa1ae",
        String.Double:           "#20af81",
        String.Escape:           "#6094DB",
        String.Heredoc:          "#20af81",
        String.Interpol:         "#bc6ec5",
        String.Other:            "#20af81",
        String.Regex:            "#5cbcac",
        String.Single:           "#20af81",
        String.Symbol:           "#d572a4",
        Number:                  "#E697E6",
        Number.Bin:              "#E697E6",
        Number.Float:            "#B7B7FF",
        Number.Hex:              "#E697E6",
        Number.Integer:          "#E697E6",
        Number.Integer.Long:     "#E697E6",
        Number.Oct:              "#E697E6",
        Operator:                "#87afff",
        Operator.Word:           "bold #4f97d7",
        Punctuation:             "#5cbcac",
        Generic:                 "#b4b7bd",
        Generic.Deleted:         "#b56777",
        Generic.Emph:            "italic",
        Generic.Error:           "#b56777",
        Generic.Heading:         "bold #b888e2",
        Generic.Inserted:        "#20af81",
        Generic.Output:          "#9a9aba",
        Generic.Prompt:          "bold #4f97d7",
        Generic.Strong:          "bold",
        Generic.Subheading:      "bold #87afd7",
        Generic.Traceback:       "#b56777",
        Error:                   "border:#b56777 #b56777",
    }
