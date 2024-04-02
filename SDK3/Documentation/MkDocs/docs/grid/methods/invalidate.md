# `control.grid.invalidate()` method

**Description:** Informs the grid system that it must realign the interface again.<br/>
**Arguments:** None

!!! note
    Calling this method does **not** realign the interface immediately. Instead, the grid system will schedule a realign process to be executed as soon as possible.

Example:

```xml
<form>
    <label name="labMyLabel" g="col" g-width="4" text="My Label"/>	

    
    <button g="block">				
        <event name="onClick">
            self.labMyLabel["g-width"] = 8;
            self.labMyLabel.grid:invalidate();				
        </event>
    </button>
</form>
```

In the example, when the user clicks on the button, the code will change the `g-width` attribute of the label to `8` and then inform the grid system that it must realign the interface as soon as possible.