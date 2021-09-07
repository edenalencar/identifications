using Gtk;
namespace Identifications{
    public class MenuApplication : Gtk.ApplicationWindow {

       private Gtk.Window window;

       public MenuApplication (Gtk.Application app) {
		    add_actions(app);
		    this.window = app.active_window;
       }

        private void on_about(){
            var dialog = new Gtk.AboutDialog ();

            dialog.set_destroy_with_parent (true);
            dialog.set_transient_for (window);
            dialog.set_modal (true);
            dialog.logo_icon_name = Constants.APP_ID;
            dialog.version = Constants.APP_VERSION;
            dialog.program_name = _("Identifications");
            dialog.comments = _("Tools to devs and QA Team test applications that needing identifications from Brazil");
            dialog.authors = { "Éden Alencar" };
            dialog.artists = {"Fabiana Alencar"};
            dialog.license_type = Gtk.License.GPL_3_0;
            dialog.website = "https://github.com/edenalencar/identifications";
            dialog.website_label = _("Site");
            dialog.translator_credits = "Éden Alencar - Brazilian Portuguese";

            dialog.run ();
            dialog.destroy ();
        }

        private void add_actions(Gtk.Application app){
               var action = new GLib.SimpleAction ("about", null);
               action.activate.connect (() => {on_about();});
               app.add_action (action);

               action = new GLib.SimpleAction ("help", null);
               action.activate.connect (() => {on_help();});
               app.add_action (action);
         }
          private void on_help () {
            try {
                Gtk.show_uri_on_window (window,
                              "help:com.github.edenalencar.identifications",
                              Gtk.get_current_event_time ());
            } catch (GLib.Error error) {
                warning ("Failed to display help: %s", error.message);
            }
        }
    }
}
