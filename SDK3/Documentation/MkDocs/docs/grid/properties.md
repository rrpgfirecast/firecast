# Properties

!!! note
    All tags/controls have all properties described here in addition to its own properties

## Basic alignment attributes

### `g` or `g-role`
**Type:** Enumerated string<br/>
**Default:** `"none"`<br/>
**Discriminable by screen size**: No<br/>
**Description:** Define the role of the control in a grid system aligned layout.

| Values          | Description                                                                                                                               | 
|-----------------| -------------------------------------------------------                                                                                   | 
| `"none"`        | The control does not align using the grid system                                                                                          | 
| `"row"`         | [Row role](concepts.md#row-role) <br> The control width occupies an entire line in the 12-column division.                                | 
| `"col"`         | [Column role](concepts.md#col-role) <br> The control width is defined by the [`g-width` attribute](#g-width)                                 | 
| `"container"`   | [Container role](concepts.md#container-role) <br> Similar to the row role, but the control's width is kept limited to avoid growing too wide. |
| `"block"`       | [Block role](concepts.md#block-role) <br> The control width is defined in pixels by its `width` attribute.                                |


-----

### `g-auto-height`
**Type:** Boolean<br/>
**Default:** `false`<br/>
**Discriminable by screen size**: No<br/>
**Description:** Defines whether the height of the control should automatically adjust to fit its children controls vertically.

When set to `true`, the grid system will calculate the height based on the content of the grid-aligned children controls.

!!! note
    When set to `true`, **only** the children controls that are grid-aligned will be considered when calculating the height for this control. 
    If there are no grid-aligned children controls (i.e., `g-role="none"`), this control will have a height of 0 plus its vertical padding.

!!! note
    Rows and Containers always behave as if their `g-auto-height` attribute is set to `true`.



## Columns-only attributes

### `g-width`
**Type:** Integer<br/>
**Default:** `1`<br/>
**Discriminable by screen size**: Yes<br/>
**Description:** Specifies how many of the 12-column pieces the control occupies.

Use an integer value between 1 and 12 to define the width of the control in terms of the 12-column grid system. 
Only controls with a `g-role` of `"col"` will respect this value to determine their width.