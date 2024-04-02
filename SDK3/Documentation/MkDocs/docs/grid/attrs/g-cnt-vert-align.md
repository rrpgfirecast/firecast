# `g-cnt-vert-align` attribute

**Type:** Enumerated string<br/>
**Default:** inherit from parent<br/>
**Allows breakdown by screen size**: Yes<br/>
**Description:** Specifies vertical alignment for the children of the control.


| Value      | Description                                                                 |
|------------|-----------------------------------------------------------------------------|
| `"top"`    | Aligns the children controls at the top of the content area.                |
| `"center"` | Aligns the children controls at the center of the content area.             |
| `"bottom"` | Aligns the children controls at the bottom of the content area.             |

The following aliases are also accepted:

| Alias       | Value     |
|-------------|-----------|
| `"middle"`  | `"center"`|


## Inheritance

The `g-cnt-vert-align` value is applied recursively to inner controls.

- If the `g-cnt-vert-align` attribute is not defined for a control, the vertical alignment used is the value defined by the parent `g-cnt-vert-align` attribute.

- If the parent control does not define a `g-cnt-vert-align`, the grid system will recursively search for the first ancestor control that defines a value for `g-cnt-vert-align` and use that value.

- If no ancestor control defines a `g-cnt-vert-align` attribute, the default `"top"` value is used.