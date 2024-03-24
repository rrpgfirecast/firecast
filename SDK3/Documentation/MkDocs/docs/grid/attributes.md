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

## Attributes for controls with *container* role

- **[`g-horz-align`](attrs/g-horz-align.md)**: Specifies horizontal alignment for the container.

## Margins and padding

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
    When a `g-margin-*`/`g-padding-*` value is not defined, the grid system will use the corresponding value defined in the control's `margins`/`padding` attribute.     

## Gutters

There are two ways to define gutter for controls, measured in pixels:

- **[`g-cnt-gutter`](attrs/g-cnt-gutter.md)**: Sets the gutter size for all content controls, i.e., for all controls that are inside.
- **`g-gutter`**: Sets the [gutter](gutter.md) size for the control only.

Learn more about the gutter [here](gutter.md);

## Vertical line spacing

- **[`g-cnt-line-spacing`](attrs/g-cnt-line-spacing.md)**: Define an amount of pixels to insert between lines inside the control.


## Alignment attributes

For children alignment:

- **[`g-cnt-vert-align`](attrs/g-cnt-vert-align.md)**: Specifies vertical alignment for the children of the control.
- **[`g-cnt-horz-align`](attrs/g-cnt-horz-align.md)**: Specifies horizontal alignment for the children of the control.

For alignment of the control itself:

- **[`g-vert-align`](attrs/g-vert-align.md)**: Specifies vertical alignment for the control itself.


## Displacement attributes

Use the following attributes to displace the control by a specified amount of pixels:

- **`g-final-offset-x`**
- **`g-final-offset-y`**

!!! note
    The `g-final-offset-*` attributes affect the control only and do not affect the positioning of following controls.

## Breakline attributes

- **`g-break-line-before`**: Set to true to force a line break before the control.
- **`g-break-line-after`**: Set to true to force a line break after the control.

## Sorting attributes

- **`g-order`**: An integer that defines the index of the control for ascending order (lower numbers appear first in the interface than greater numbers). Default: 0.
- **`g-group`**: An integer that defines which group the control belongs to. The groups are sorted in ascending order. Default: 0.

Controls are sorted first by their group (ascending `g-group` number), and then controls within each group are sorted by their `g-index` value.

## Visibility attributes

- **`g-invisible-reserved`**: Set to true to force the grid system to reserve space and consider this control in the layout even if it is invisible (its `visible` attribute is `false`).


## Dynamic size attributes based on text content

- **[`g-dyn-width-txt`](attrs/g-dyn-width-txt.md)**: Specifies whether the Grid System should dynamically calculate the width for the control based on its text content.
- **[`g-dyn-height-txt`](attrs/g-dyn-height-txt.md)**: Specifies whether the Grid System should dynamically calculate the height for the control based on its text content.

## Tiling attributes

- **[`g-vert-tile`](attrs/g-vert-tile.md)**: Specifies whether the Grid System should calculate the control's height to fill the available vertical area.

- **`g-vert-tile-weight`**: A real number that determines the weight this control has when filling the available vertical area. It is used when multiple lines want to fill a content height. Lines with a higher average `g-vert-tile-weight` will "grow more" than lines with a lower average `g-vert-tile-weight`. Default: 1.0

- **`g-horz-tile`**: Specifies whether the Grid System should calculate the control's width to fill the available horizontal area. This attribute functions similarly to `g-vert-tile` but applies to horizontal spaces.


## Size constraint attributes

For width:

- **`g-min-width`**: Specifies the minimum width the control should have, measured in pixels. The grid system will ensure that the control width is not less than this value.
- **`g-max-width`**: Specifies the maximum width the control should have, measured in pixels. The grid system will ensure that the control width is not more than this value.

For height:

- **`g-min-height`**: Specifies the minimum height the control should have, measured in pixels. The grid system will ensure that the control height is not less than this value.
- **`g-max-height`**: Specifies the maximum height the control should have, measured in pixels. The grid system will ensure that the control height is not more than this value.


## Attributes used when mixing `col` and `block` roles

- **[`g-cnt-min-grid-width`](attrs/g-cnt-min-grid-width.md)**: Specifies the minimum width, measured in pixels, that the entire 12 columns of the content should have.

- **[`g-cnt-min-grid-width-ft`](attrs/g-cnt-min-grid-width-ft.md)**: Specifies the minimum width, measured as a factor of the control width, that the entire 12 columns of the content should have.


## Special built-in attributes

- **`g-dyn-width-single-line`**: If set to true, the grid system will calculate the width for the control so it can fit horizontally all of its children `block` controls into a single line, without the need for breaklines. It replaces the [`g-on-get-width`](events/g-on-get-width.md) event.<br><br>

- **`g-dyn-width-each-line`**: If set to true, the grid system will calculate the width for the control so it can fit horizontally each of its children `block` controls into separate lines. It replaces the [`g-on-get-width`](events/g-on-get-width.md) event.<br><br>

- **`g-dyn-width-match-height`**: If set to true, the grid system will calculate the width for the control so it matches the control height. It replaces the [`g-on-aligned`](events/g-on-aligned.md) event.