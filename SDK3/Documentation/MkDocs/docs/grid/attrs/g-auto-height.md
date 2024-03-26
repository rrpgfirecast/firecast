# `g-auto-height` attribute

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
