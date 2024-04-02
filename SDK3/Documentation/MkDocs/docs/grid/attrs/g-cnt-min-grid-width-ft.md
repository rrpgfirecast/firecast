# `g-cnt-min-grid-width-ft` attribute

**Type:** Real number between 0.0 and 1.0<br/>
**Default:** Inherit from parent<br/>
**Allows breakdown by screen size**: Yes<br/>
**Description:** Specifies the minimum width, measured as a factor of the control width, that the entire 12 columns of the content should have.

!!! note
    This attribute is used when mixing `col` role controls and `block` role controls in a layout.

As explained [here](../concepts.md#blocks-and-the-12-column-spaces), controls with a `block` role shrink the available 12-column width.  
This attribute defines the minimum width that the 12 columns should have before a line break occurs.

This attribute is defined in the range from 0.0 to 1.0, where:

- `0.0` means no minimum width.
- `0.5` means half of the control width.
- `1.0` means the entire control width.

If the `col` controls' width on the screen is too small when mixed with `block` controls, use this attribute to inform what is the minimum required width for the 12 columns to properly display the `col` controls.

If you want to specify the minimum grid width in terms of pixel count, use the [`g-cnt-min-grid-width`](g-cnt-min-grid-width.md) instead.

!!! warning
    Do not define values for both [`g-cnt-min-grid-width`](g-cnt-min-grid-width.md) and `g-cnt-min-grid-width-ft` at the same time, as they are mutually exclusive.

## Inheritance

The `g-cnt-min-grid-width-ft` value is applied recursively to inner controls.

- If neither `g-cnt-min-grid-width` nor `g-cnt-min-grid-width-ft` attribute is defined for a control, the value defined by its parent `g-cnt-min-grid-width` or `g-cnt-min-grid-width-ft` attribute is used.

- If the parent control does not define `g-cnt-min-grid-width` nor `g-cnt-min-grid-width-ft`, the grid system will recursively search for the first ancestor control that defines a value for `g-cnt-min-grid-width` or `g-cnt-min-grid-width-ft` and use that value.

- If no ancestor control defines `g-cnt-min-grid-width` nor `g-cnt-min-grid-width-ft` attribute, the default `0.0` value is used.