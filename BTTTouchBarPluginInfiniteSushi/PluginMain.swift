import Foundation
import AppKit
@objc class PluginMain : NSObject, BTTPluginInterface
{
    // the delegate will be set automatically after this plugin is loaded in BTT
    var delegate : BTTTouchBarPluginDelegate?


    var customVC: PluginViewController?;
    var configurationValues: Dictionary<AnyHashable, Any> = [:];


    /* MARK: Option 3: Returning a NSViewController instance
     * if you return a view controller BTT will display the view
     * controller's view on
     * the Touch Bar.
     * You are responsible for any styling you want to apply.
     * Make sure to always return the same instance of the button
     * here.
     */
    func touchBarViewController() -> NSViewController? {
        if(self.customVC == nil) {
            self.customVC = PluginViewController.init();
            self.configure();

        }
        return self.customVC;
    }


    func configure() {
        if((self.configurationValues["plugin_var_widgetName"]) != nil) {
            // do something to the view
        }
    }

    // here you can configure what items are shown in the BTT configuration side-bar for this plugin
    class func configurationFormItems() -> BTTPluginFormItem? {

        // here we just create a text field, we will receive the
        // current value in didReceiveNewConfigurationValues
        let item = BTTPluginFormItem.init();

        return item;
    }

    func didReceiveNewConfigurationValues(_ configurationValues: [AnyHashable : Any]) {
        self.configurationValues = configurationValues;
        if (self.customVC != nil) {
            self.configure();
        }
    }

    // this will tell BTT to execute the actions the user assigned to this widget
    @objc func executeAssignedBTTActions() {
        self.delegate?.executeAssignedBTTActions(self);
    }

}

