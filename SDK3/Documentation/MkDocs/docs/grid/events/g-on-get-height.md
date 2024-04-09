# `g-on-get-height` event

**Description:** Called so you can provide dynamic height logic to the control.<br/>
**Allows breakdown by screen size**: Yes<br/>

**Arguments:**

+----------------------+---------------------------------------------------------------------+
| Argument             | Description                                                         |
+======================+=====================================================================+
| `screenSize`         | The screen size for which the interface is being aligned.<br>       |
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
| `height`             | The default height that the grid system will use if the event does  | 
|                      | not return a new value.                                             |
+----------------------+---------------------------------------------------------------------+

To inform the grid system that you want to use a new height, you must **return** a number inside the event.

Example:

```xml
<form>
    <button text="Button 2" g="block" g-on-get-height="return 2 + 9 + 33;"/>	
</form>
```

In this example, the button's height will be equal to the sum calculated in Lua.