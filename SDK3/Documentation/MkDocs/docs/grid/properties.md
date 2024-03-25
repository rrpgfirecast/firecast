# Properties

!!! note
    All tags/controls have all properties described here in addition to their own properties.

## Basic alignment attributes

### `g` or `g-role`
**Type:** Enumerated string<br/>
**Default:** `"none"`<br/>
**Allows breakdown by screen size**: No<br/>
**Description:** Define the role of the control in a grid system aligned layout.

| Value         | Description                                                                                                                               | 
|---------------|-------------------------------------------------------------------------------------------------------------------------------------------| 
| `"none"`      | The control does not align using the grid system.                                                                                         | 
| `"row"`       | [Row role](concepts.md#row-role) - The control occupies an entire line in the 12-column division.                                         | 
| `"col"`       | [Column role](concepts.md#col-role) - The control's width is defined by the [`g-width`](#g-width) attribute.                              | 
| `"container"` | [Container role](concepts.md#container-role) - Similar to the row role, but the control's width is limited to avoid growing too wide.     |
| `"block"`     | [Block role](concepts.md#block-role) - The control's width is defined in pixels by its `width` attribute.                                 |


-----

### `g-auto-height`
**Type:** Boolean<br/>
**Default:** `false`<br/>
**Allows breakdown by screen size**: No<br/>
**Description:** Specifies whether the control's height should adjust automatically to fit its grid-aligned children controls vertically.

When set to `true`, the grid system calculates the height based on the content of the grid-aligned children controls.

!!! warning
    When set to `true`, **only** the children controls that are grid-aligned are considered when calculating the height for this control. 
    If there are no children controls with `g-role` different from `"none"`, this control's height will be so small that it could become invisible without padding.

!!! note
    Rows and Containers always behave as if their `g-auto-height` attribute is set to `true`.


## Columns-only attributes

### `g-width`
**Type:** Integer<br/>
**Default:** `1`<br/>
**Allows breakdown by screen size**: Yes<br/>
**Description:** Specifies how many of the 12 columns the control occupies.

Use an integer value between 1 and 12 to define the width of the control in terms of the [12-column grid system](concepts.md#key-concept-the-12-column-division). 
Only controls with `g-role` set to `"col"` respect this value to determine their width.