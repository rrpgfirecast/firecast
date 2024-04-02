# `g-width` attribute

**Type:** Integer (12-column count)<br/>
**Default:** `1`<br/>
**Allows breakdown by screen size**: Yes<br/>
**Description:** How many 12-columns count the the control occupies

Use an integer value between 1 and 12 to define the width of the control in terms of the [12-column grid system](../concepts.md#key-concept-the-12-column-division). 
Only controls with [`g-role`](g-role.md) set to `"col"` respect this value to determine their width.