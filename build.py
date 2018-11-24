from pybuilder.core import use_plugin, init

use_plugin("python.core")
use_plugin("pypi:pybuilder_pytest")
use_plugin('pypi:pybuilder_pytest_coverage')
use_plugin("python.install_dependencies")
use_plugin("python.distutils")

name = "new"
default_task = "publish"


@init
def set_properties(project):
    project.set_property_if_unset("pytest_coverage_break_build_threshold", 50)
