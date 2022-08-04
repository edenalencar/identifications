project('com.github.edenalencar.identifications', ['c', 'vala'],
          version: '0.3.1',
    meson_version: '>= 0.56.2',
  default_options: [ 'warning_level=2',
                   ],
)

app_binary = 'Identifications'
app_id = meson.project_name()
app_install_prefix = get_option('prefix')


add_project_arguments('-DGETTEXT_PACKAGE="@0@"'.format(app_id), language: 'c')

conf_data = configuration_data()
conf_data.set_quoted('APP_ID', app_id)
conf_data.set_quoted('APP_VERSION', meson.project_version())
conf_data.set_quoted('APP_INSTALL_PREFIX', app_install_prefix)

app_constants = configure_file(
    input : 'constants.vala.in',
    output : 'constants.vala',
    configuration : conf_data
)

i18n = import('i18n')
gnome = import('gnome')

subdir('data')
subdir('help')
subdir('src')
subdir('po')

meson.add_install_script('build-aux/meson/postinstall.py')
