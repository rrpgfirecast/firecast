# `g-offset` attribute

**Type:** Integer (12-column count)<br/>
**Default:** `0`<br/>
**Allows breakdown by screen size**: Yes<br/>
**Description:** Layout offset

Offset in 12-column count that must be applied to the control. When different than `0`, the Grid System moves the control to a different column position. The displacement is measured by the `g-offset` value. 

- **Negative** values will move the control backward.
- **Positive** values will move the control forward.

!!! note
    This attribute affects the following controls in the layout, as it moves the *grid positioning cursor*.      
    Use [`g-push`](g-push.md) or [`g-pull`](g-pull.md) instead if you want to displace the control without affecting other controls.