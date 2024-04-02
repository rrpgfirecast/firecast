# `g-cnt-horz-align` attribute

**Type:** Enumerated string<br/>
**Default:** inherit from parent<br/>
**Allows breakdown by screen size**: Yes<br/>
**Description:** Specifies horizontal alignment for the children of the control.


| Value       | Description                                                                        |
|-------------|------------------------------------------------------------------------------------|
| `"start"`   | Aligns the children controls at the start of the content area (aka left).          |
| `"center"`  | Aligns the children controls at the center of the content area.                    |
| `"end"`     | Aligns the children controls at the end of the content area (aka right).           |
| `"around"`  | Justifies the children controls, distributing spaces around the children controls.   |
| `"between"` | Justifies the children controls, distributing spaces between the children controls.  |

The following aliases are also accepted:

| Alias       | Value     |
|-------------|-----------|
| `"left"`    | `"start"` |
| `"middle"`  | `"center"`|
| `"right"`   | `"end"`   |

## Inheritance

The `g-cnt-horz-align` value is applied recursively to inner controls.

- If the `g-cnt-horz-align` attribute is not defined for a control, the horizontal alignment used is the value defined by the parent `g-cnt-horz-align` attribute.

- If the parent control does not define a `g-cnt-horz-align`, the grid system will recursively search for the first ancestor control that defines a value for `g-cnt-horz-align` and use that value.

- If no ancestor control defines a `g-cnt-horz-align` attribute, the default `"start"` value is used.