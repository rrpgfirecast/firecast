# `control.grid.reset()` method

**Description:** Resets all grid attributes and events of the control to their default values.<br/>
**Arguments:** None

Example:

```xml
<form>
    <label name="labMyLabel" g="col" g-width="4" text="My Label"/>	

    <button g="block" onClick="self.labMyLabel.grid:reset()"/>		
</form>
```

In the example, when the user clicks on the button, the label will stop being grid-aligned because all its grid attributes, including the `g` attribute, will be reset to their default initial values.