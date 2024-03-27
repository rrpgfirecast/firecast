# `g` attribute or `g-role` attribute

**Type:** Enumerated string<br/>
**Default:** `"none"`<br/>
**Allows breakdown by screen size**: No<br/>
**Description:** The role of the control in a grid system aligned layout.

| Value         | Description                                                                                                                               | 
|---------------|-------------------------------------------------------------------------------------------------------------------------------------------| 
| `"none"`      | The control does not align using the grid system.                                                                                         | 
| `"row"`       | [Row role](../concepts.md#row-role) - The control occupies an entire line in the 12-column division.                                      | 
| `"col"`       | [Column role](../concepts.md#col-role) - The control's width is defined by the [`g-width`](g-width.md) attribute.                           | 
| `"container"` | [Container role](../concepts.md#container-role) - Similar to the row role, but the control's width is limited to avoid growing too wide.  |
| `"block"`     | [Block role](../concepts.md#block-role) - The control's width is defined in pixels by its `width` attribute.                              |


!!! note
    `g` is just a shorthand for `g-role`