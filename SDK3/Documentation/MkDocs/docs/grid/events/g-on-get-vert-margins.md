# `g-on-get-vert-margins` event


**Description:** Called so you can provide dynamic vertical margins logic to the control.<br/>
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
| `height`             | The planned height for the control.                                 |
+----------------------+---------------------------------------------------------------------+
| `top`                | The default top margin the grid system will use if the event does   |
|                      | not return a new value.                                             |
+----------------------+---------------------------------------------------------------------+
| `bottom`             | The default bottom margin the grid system will use if the event     |
|                      | does not return a new value.                                        |
+----------------------+---------------------------------------------------------------------+

To inform the grid system that you want to use new vertical margins, you must **return** two numbers inside the event. The first returned number is the new top margin and the second returned number is the new bottom margin.

Example:

```xml
<form>
    <script>
        local function calculateTopMargin()
            return 1 + 2 + 3;
        end;
        
        local function calculateBottomMargin()
            return 3 + 3;
        end;
    </script>

    <button text="Button 2" g="block" 
            g-on-get-vert-margins="return calculateTopMargin(), calculateBottomMargin();"/>	
</form>
```

In this example, the button's top margin will be equal to the result of the function `calculateTopMargin` while the bottom margin will be the result of the function `calculateBottomMargin`.