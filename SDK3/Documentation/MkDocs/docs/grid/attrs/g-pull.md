# `g-pull` attribute

**Type:** Integer (12-column count)<br/>
**Default:** `0`<br/>
**Allows breakdown by screen size**: Yes<br/>
**Description:** Pull offset

When different than `0`, the Grid System moves the control backward to a different column position. The displacement is measured by the `g-pull` value. 

If you want to offset in the forward direction, use [`g-push`](g-push.md) instead.

!!! note
    This attribute displaces the control only, without affecting the positioning of other controls.
    If you want to displace this control and the following controls, use [`g-offset`](g-offset.md) instead.