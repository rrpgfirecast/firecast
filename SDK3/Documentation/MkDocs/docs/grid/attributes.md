# Grid attributes

!!! note
    All tags/controls have all attributes described here in addition to their own attributes.


## Base attributes

- [**`g` or `g-role`**](attrs/g-role.md): The role of the control in a grid system aligned layout.
- [**`g-auto-height`**](attrs/g-auto-height.md): Specifies whether the control's height should adjust automatically to fit its grid-aligned children controls vertically.  

## Attributes for controls with *col* role

- [**`g-width`**](attrs/g-width.md): How many 12-columns count the the control occupies.
- [**`g-offset`**](attrs/g-offset.md): Layout offset
- [**`g-push`**](attrs/g-push.md): Push offset
- [**`g-pull`**](attrs/g-pull.md): Pull offset 


## Spacing attributes

### Margins and Padding

Margins are defined individually by side, in pixel count:

- **`g-margin-left`**
- **`g-margin-top`**
- **`g-margin-right`**
- **`g-margin-bottom`**

Padding is also defined individually by side, in pixel count:

- **`g-padding-left`**
- **`g-padding-top`**
- **`g-padding-right`**
- **`g-padding-bottom`**

!!! note
    When a `g-margin-*`/`g-padding-*` value is not defined, the grid system will use the corresponding side value defined in the control's `margins`/`padding` attribute.     

### Gutters

There are two ways to define gutter for controls, measured in pixels:

- **[`g-cnt-gutter`](attrs/g-cnt-gutter.md)**: Sets the gutter size for all content controls, i.e., for all controls that are inside.
- **`g-gutter`**: Sets the gutter size for the control only.

Learn more about the gutter [here](gutter.md);

### Vertical line spacing

- **[`g-cnt-line-spacing`](attrs/g-cnt-line-spacing.md)**: Define an amount of pixels to insert between lines inside the control.




