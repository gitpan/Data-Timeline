use inc::Module::Install;
include 'Module::AutoInstall';

name 'Data-Timeline';
all_from 'lib/Data/Timeline.pm';
perl_version '5.006';

requires 'Class::Accessor::Complex';
requires 'Class::Accessor::Constructor';
requires 'DateTime::Format::DateParse';
requires 'HTML::Table';
requires 'Text::SimpleTable';

build_requires 'Test::More' => '0.70';

# feature 'Generated documentation',
#     - default => 1,
#     'Pod::Generated' => '0.02';

auto_install;

process_templates(
    first_year => 2007,
    rest_from  => "$ENV{HOME}/.mitlib/standard_pod",
    start_tag  => '{%',
    end_tag    => '%}',
);

use_standard_tests(without => 'pod_coverage');
auto_include;
WriteAll;
