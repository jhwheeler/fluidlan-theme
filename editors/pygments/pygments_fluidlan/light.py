"""Fluidlan Light — Pygments style.

Generated from palette.json — do not edit by hand.
Run: python3 generate.py
"""

from pygments.style import Style
from pygments.token import Comment, Error, Generic, Keyword, Literal, Name, Number, Operator, Punctuation, String, Token


class FluidlanLightStyle(Style):
    name = "fluidlan-light"
    background_color = "#dcd8d0"
    highlight_color = "#b0a8d0"

    styles = {
        Token:                   "#252028",
        Comment:                 "italic #086068",
        Comment.Preproc:         "#801890",
        Comment.PreprocFile:     "#5820c0",
        Comment.Special:         "bold italic #086068",
        Keyword:                 "bold #1050a8",
        Keyword.Constant:        "#2828c0",
        Keyword.Declaration:     "bold #1050a8",
        Keyword.Namespace:       "bold #5828a8",
        Keyword.Pseudo:          "#6018b8",
        Keyword.Reserved:        "bold #1050a8",
        Keyword.Type:            "#1050a8",
        Name:                    "#252028",
        Name.Attribute:          "#1850a0",
        Name.Builtin:            "#701888",
        Name.Builtin.Pseudo:     "#2828c0",
        Name.Class:              "bold #1050a8",
        Name.Constant:           "#2828c0",
        Name.Decorator:          "#5828a8",
        Name.Entity:             "#6018b8",
        Name.Exception:          "bold #8f4f5f",
        Name.Function:           "#701888",
        Name.Function.Magic:     "#701888",
        Name.Label:              "#6018b8",
        Name.Namespace:          "#1050a8",
        Name.Other:              "#007048",
        Name.Property:           "#1850a0",
        Name.Tag:                "#7018a8",
        Name.Variable:           "#007048",
        Name.Variable.Class:     "#007048",
        Name.Variable.Global:    "#007048",
        Name.Variable.Instance:  "#007048",
        Name.Variable.Magic:     "#6018b8",
        Literal:                 "#801890",
        Literal.Date:            "#008050",
        String:                  "#008050",
        String.Affix:            "#008050",
        String.Backtick:         "#008050",
        String.Char:             "#901860",
        String.Delimiter:        "#108868",
        String.Doc:              "italic #086068",
        String.Double:           "#008050",
        String.Escape:           "#1048b0",
        String.Heredoc:          "#008050",
        String.Interpol:         "#701888",
        String.Other:            "#008050",
        String.Regex:            "#108868",
        String.Single:           "#008050",
        String.Symbol:           "#901860",
        Number:                  "#801890",
        Number.Bin:              "#801890",
        Number.Float:            "#3030c0",
        Number.Hex:              "#801890",
        Number.Integer:          "#801890",
        Number.Integer.Long:     "#801890",
        Number.Oct:              "#801890",
        Operator:                "#1840b8",
        Operator.Word:           "bold #1050a8",
        Punctuation:             "#108868",
        Generic:                 "#252028",
        Generic.Deleted:         "#8f4f5f",
        Generic.Emph:            "italic",
        Generic.Error:           "#8f4f5f",
        Generic.Heading:         "bold #5828a8",
        Generic.Inserted:        "#008050",
        Generic.Output:          "#555370",
        Generic.Prompt:          "bold #1050a8",
        Generic.Strong:          "bold",
        Generic.Subheading:      "bold #1850a0",
        Generic.Traceback:       "#8f4f5f",
        Error:                   "border:#8f4f5f #8f4f5f",
    }
