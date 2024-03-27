# `g-cnt-gutter` attribute

**Type:** Real number (pixel count)<br/>
**Default:** inherit from parent<br/>
**Allows breakdown by screen size**: Yes<br/>
**Description:** Sets the gutter size for all content controls, i.e., for all controls that are inside.

This attribute allows you to set the gutter size for all content controls within a control, ensuring consistent spacing throughout the content.

## Inheritance

The `g-cnt-gutter` value is applied recursively to inner controls.

- If the `g-gutter` attribute is not defined for a control, the gutter size used is the value defined by the parent `g-cnt-gutter` attribute.
- If the parent control does not define a `g-cnt-gutter`, the grid system will recursively search for the first ancestor control that defines a value for `g-cnt-gutter` and use that value.
- If no ancestor control defines a `g-cnt-gutter` attribute, the default gutter size of 30px will be used.

Learn more about the gutter [here](../gutter.md);