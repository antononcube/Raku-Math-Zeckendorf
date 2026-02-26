### Literate programming

Two Literate Programming (LT) solutions are included:

1. Jupyter notebook, "Zeckendorf-representation.ipynb"
2. Computational (or executable) Markdown file "Zeckendorf-representation-work.md" 
    - From which "Zeckendorf-representation.md" is produced.

In order to use the 2nd LT solution:

- Install the packages in the "Setup" section of "Zeckendorf-representation-work.md"
- In addition, install the package "Text::CodeProcessing"
- Run the following commands (starting at repository's directory):

```
cd docs
file-code-chunks-eval Zeckendorf-representation-work.md -o Zeckendorf-representation.md
```

**Remark:** Because GitHub (and other) Markdown renderers do not render SVG images in Markdown documents, the matrix and chord plots are exported as SVG files, and links to them are put in the "woven" Markdown file.
