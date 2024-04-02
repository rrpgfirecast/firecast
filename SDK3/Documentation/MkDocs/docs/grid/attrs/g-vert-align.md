# `g-vert-align` attribute

**Type:** Enumerated string<br/>
**Default:** inherit from parent `g-cnt-vert-align` attribute<br/>
**Allows breakdown by screen size**: Yes<br/>
**Description:** Specifies vertical alignment for the control itself.


| Value      | Description                                                                 |
|------------|-----------------------------------------------------------------------------|
| `"top"`    | Aligns the control at the top of its line area.                             |
| `"center"` | Aligns the control at the center of its line area.                          |
| `"bottom"` | Aligns the control at the bottom of its line area.                          |

The following aliases are also accepted:

| Alias       | Value     |
|-------------|-----------|
| `"middle"`  | `"center"`|


Both the parent's [`g-cnt-vert-align`](g-cnt-vert-align.md) attribute and the control's `g-vert-align` attribute are considered when aligning the control vertically: While the parent's [`g-cnt-vert-align`](g-cnt-vert-align.md) is used to align **all** lines of the content, the `g-vert-align` is used to align the control inside its line only.