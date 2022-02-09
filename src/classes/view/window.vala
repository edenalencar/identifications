/* window.vala
 *
 * Copyright 2021-2022 Éden Alencar
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

using Gtk;
using Gee;
namespace Identifications {
	[GtkTemplate (ui = "/com/github/edenalencar/identifications/ui/window.ui")]
	public class Window : Gtk.ApplicationWindow {

		[GtkChild]
	    unowned Gtk.MenuButton menu_buttom;

	    [GtkChild]
        unowned Gtk.TextView result_cpf;

        [GtkChild]
        unowned Gtk.TextView result_cnpj;

        [GtkChild]
        unowned Gtk.TextView result_ie;

        [GtkChild]
        unowned Gtk.CheckButton checkbox_formmated;

        [GtkChild]
        unowned Gtk.CheckButton checkbox_formmated_cnpj;

        [GtkChild]
        unowned Gtk.CheckButton checkbox_formmated_ie;

        [GtkChild]
        unowned Gtk.CheckButton checkbox_branches_cnpj;

        [GtkChild]
        unowned Gtk.SpinButton spinbuttom_amount;

        [GtkChild]
        unowned Gtk.SpinButton spingbuttom_amount_cnpj;

        [GtkChild]
        unowned Gtk.SpinButton spingbuttom_amount_ie;

        [GtkChild]
        unowned Gtk.TextBuffer textbuffer_result_cpf;

        [GtkChild]
        unowned Gtk.TextBuffer textbuffer_result_cnpj;

        [GtkChild]
        unowned Gtk.TextBuffer textbuffer_result_ie;

        [GtkChild]
        unowned Gtk.ComboBox comboBox_states;

        unowned Gtk.Clipboard clipboard;

		public Window (Gtk.Application app) {
			Object (application: app);
		    startMenuButton();
			startClipboard(app);
            startAccels(app);
            startAmount();
		}


		[GtkCallback]
		public void generate_cpf(){
		    var builder = new StringBuilder();
		    for(int i = 0; i < spinbuttom_amount.get_value(); i++){
		        var identification_cpf = IdentificationIeFactory.get_instance().get_identification(Constants.CPF);

                if(checkbox_formmated.active){
                    builder.append(identification_cpf.get_identification_formmated()+"\n");

                }else{
                     builder.append(identification_cpf.get_identification()+"\n");
                }
		    }

		    textbuffer_result_cpf.set_text(builder.str);
		    result_cpf.set_buffer(textbuffer_result_cpf);
		}

		[GtkCallback]
		public void generate_cnpj(){

            var builder = new StringBuilder();
            Gee.List<Identification> identification_cnpj = new ArrayList<Identification>();

            if(checkbox_branches_cnpj.active){
                var headquarters = IdentificationIeFactory.get_instance().get_identification(Constants.CNPJ);
                identification_cnpj.add(headquarters);

                for(int i = 1; i < spingbuttom_amount_cnpj.get_value(); i++){
                    var branche = new IdentificationCNPJ.With_Branches(headquarters.identification.core,i.to_string());
                    identification_cnpj.add(branche);

                }
                foreach(var indentification  in identification_cnpj){
                    if(checkbox_formmated_cnpj.active){
                        builder.append(indentification.get_identification_formmated()+"\n");
                    }else{
                        builder.append(indentification.get_identification()+"\n");
                    }
                }
            }else{
                for(int i = 0; i < spingbuttom_amount_cnpj.get_value(); i++){
                    var identification = new IdentificationCNPJ();
                    if(checkbox_formmated_cnpj.active){
                        builder.append(identification.get_identification_formmated()+"\n");
                    }else{
                        builder.append(identification.get_identification()+"\n");
                    }
                }
            }

            textbuffer_result_cnpj.set_text(builder.str);
            result_cnpj.set_buffer(textbuffer_result_cnpj);
		}


		[GtkCallback]
		public void generate_ie(){
            var builder = new StringBuilder();

            TreeIter tree;
            comboBox_states.get_active_iter(out tree);
            Value value;
            comboBox_states.get_model().get_value(tree, 0, out value);

            for(int i = 0; i < spingbuttom_amount_ie.get_value(); i++){
                var identification_ie = IdentificationIeFactory.get_instance().get_identification("IE-".concat(value.get_string()));
                if(checkbox_formmated_ie.active){
                    builder.append(identification_ie.get_identification_formmated()+"\n");
                }else{
                     builder.append(identification_ie.get_identification()+"\n");
                }

            }
		    textbuffer_result_ie.set_text(builder.str);
		    result_ie.set_buffer(textbuffer_result_ie);
		}

		[GtkCallback]
		public void copy_to_clipboard(Gtk.Button button){
            if(button.get_name() == "buttom_copy_cpf"){
		        clipboard.set_text (textbuffer_result_cpf.text, -1);
		    }else if(button.get_name() == "buttom_copy_cnpj"){
		        clipboard.set_text (textbuffer_result_cnpj.text, -1);
	    	}else if(button.get_name() == "buttom_copy_ie"){
		        clipboard.set_text (textbuffer_result_ie.text, -1);
	    	}
	    }


		private void startMenuButton(){
		    var builder = new Gtk.Builder.from_resource("/com/github/edenalencar/identifications/ui/menu.ui");
			MenuModel menu = (MenuModel) builder.get_object("app-menu");
			menu_buttom.popover = new Gtk.Popover.from_model(menu_buttom, menu);
		}

		private void startClipboard(Gtk.Application app){
		    clipboard = Clipboard.get_for_display(app.get_active_window().get_display(),Gdk.SELECTION_CLIPBOARD);
		}

		private void startAccels(Gtk.Application app){
		    app.set_accels_for_action("app.help", {"F1"});
			app.set_accels_for_action("app.shortcuts", {"<Primary>question"});
		}

	    private void startAmount(){
            spinbuttom_amount.set_value(1);
            spingbuttom_amount_cnpj.set_value(1);
            spingbuttom_amount_ie.set_value(1);
        }
    }
}
