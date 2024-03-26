# `g-push` attribute

**Type:** Integer (12-column count)<br/>
**Default:** `0`<br/>
**Allows breakdown by screen size**: Yes<br/>
**Description:** Push offset

When different than `0`, the Grid System moves the control forward to a different column position. The displacement is measured by the `g-push` value. 

If you want to offset in the backward direction, use [`g-pull`](g-pull.md) instead.

!!! note
    This attribute displaces the control only, without affecting the positioning of other controls.
    If you want to displace this control and the following controls, use [`g-offset`](g-offset.md) instead.