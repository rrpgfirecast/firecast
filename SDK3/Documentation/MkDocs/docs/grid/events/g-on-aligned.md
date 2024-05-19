# `g-on-aligned` event

**Description:** Called to inform that an alignment process has finished.<br/>
**Allows breakdown by screen size**: Yes<br/>

**Arguments:**

+----------------------+---------------------------------------------------------------------+
| Argument             | Description                                                         |
+======================+=====================================================================+
| `screenSize`         | The screen size class the interface was aligned for.<br>            |
|                      | It can be one of the following string values: <br><br>              |
|                      |                                                                     |   
|                      | - `"xs"` - Extra small screen size                                  |   
|                      | - `"sm"` - Small screen size                                        |   
|                      | - `"md"` - Medium screen size                                       |   
|                      | - `"lg"` - Large screen size                                        |   
|                      | - `"xl"` - Extra large screen size                                  |   
|                      |                                                                     |   
|                      | Learn more about screen size breakdowns                             |   
|                      | [here](../concepts.md#key-concept-screen-size-breakdown)            |   
+----------------------+---------------------------------------------------------------------+
| `changedBounds`      | Boolean; `true` if the control has its bounds changed during the    |
|                      | align process.                                                      |
+----------------------+---------------------------------------------------------------------+
| `childChangedBounds` | Boolean; `true` if some child control has its bounds changed during |
|                      | the align process.                                                  | 
+----------------------+---------------------------------------------------------------------+