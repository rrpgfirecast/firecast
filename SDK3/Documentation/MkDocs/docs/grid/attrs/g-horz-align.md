# `g-horz-align` attribute

**Type:** Enumerated string<br/>
**Default:** `"center"`<br/>
**Allows breakdown by screen size**: Yes<br/>
**Description:** Specifies horizontal alignment for the container.

!!! warning
    This attribute is used for [`container`](../concepts.md#container-role) role controls **only**.

| Value       | Description                                                                     |
|-------------|---------------------------------------------------------------------------------|
| `"start"`   | Aligns the container at the start of the content area (aka. left alignment).    |
| `"center"`  | Aligns the container at the center of the content area.                         |
| `"end"`     | Aligns the container at the end of the content area (aka.  right alignment).    |


The following aliases are also accepted:

| Alias       | Value     |
|-------------|-----------|
| `"left"`    | `"start"` |
| `"middle"`  | `"center"`|
| `"right"`   | `"end"`   |