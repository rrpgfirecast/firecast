# `g-on-prepare` event

**Description:** Called so you can prepare and/or adjust the interface for different screen sizes.<br/>
**Allows breakdown by screen size**: Yes<br/>

**Arguments:**

+--------------+--------------------------------------------------------------------+
| Argument     | Description                                                        |
+==============+====================================================================+
| `screenSize` | The screen size the interface needs to be prepared for.<br>        |
|              | It can be one of the following string values: <br><br>             |
|              |                                                                    |   
|              | - `"xs"` - Extra small screen size.                                |   
|              | - `"sm"` - Small screen size.                                      |   
|              | - `"md"` - Medium screen size.                                     |   
|              | - `"lg"` - Large screen size.                                      |   
|              | - `"xl"` - Extra large screen size.                                |   
|              |                                                                    |   
|              | Learn more about screen size breakdowns                            |   
|              | [here](../concepts.md#key-concept-screen-size-breakdown).          |   
+--------------+--------------------------------------------------------------------+


The event is called whenever an interface needs to be prepared and/or adjusted for a different screen size. It is called at the first layout organization and whenever the screen size class changes.

Example: 

```xml 
<form>
	<layout g="container">
		<layout name="leftMenu" g="block" width="60" g-vert-tile="true">
			<!-- Left menu content here -->
		</layout>
		
		<col g-width="12" g-vert-tile="true">
			<!-- Center content here -->	
		</col>
		
		<event name="g-on-prepare-xs">
			self.leftMenu.visible = false;
		</event>
		
		<event name="g-on-prepare-lg">
			self.leftMenu.visible = true;
		</event>		
	</layout>
</form>
```

The example will hide a left menu on screen sizes `"xs"`, `"sm"`, `"md"` and show it on screen sizes `"lg"` and `"xl"`.