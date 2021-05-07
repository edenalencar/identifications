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
            dialog.program_name = _("Identificacoes");
            dialog.comments = _("Tools to devs and QA Team test applications that needing identifications from Brazil");
            dialog.authors = { "Éden Alencar" };
            dialog.artists = {"Fabiana Alencar"};
            dialog.license_type = Gtk.License.GPL_3_0;
            dialog.website = "https://dialogandoti.com.br";
            dialog.website_label = _("Official WebPage");
            dialog.translator_credits = "Éden Alencar - Brazilian Portuguese";

            dialog.run ();
            dialog.destroy ();
        }

        private void add_actions(Gtk.Application app){
               var action = new GLib.SimpleAction ("about", null);
               action.activate.connect (() => {on_about();});
               app.add_action (action);
           }
        }
}