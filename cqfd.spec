Name:           cqfd
Version:        5.7.0
Release:        1
Summary:        A tool to wrap commands in controlled Docker containers

License:        GPL-3.0-or-later
Source0:        https://github.com/savoirfairelinux/%{name}/archive/v%{version}.tar.gz

BuildArch:      noarch
BuildRequires:  make
BuildRequires:  pkgconfig(bash-completion)
Requires:       bash
Requires:       docker

%description
Run commands in the current directory within a container defined in a per-project config file.

%global debug_package %{nil}

%prep
%setup -q


%check
make check


%install
%make_install PREFIX=/usr


%files
%{_bindir}/cqfd
%{_datadir}/bash-completion/completions/%{name}
%doc %{_datadir}/doc/cqfd/AUTHORS
%doc %{_datadir}/doc/cqfd/CHANGELOG.md
%doc %{_datadir}/doc/cqfd/README.md
%license %{_datadir}/doc/cqfd/LICENSE
%{_datadir}/%{name}/samples/Dockerfile.focalFossa.android34
%{_datadir}/%{name}/samples/Dockerfile.focalFossa.nodejs20x
%{_datadir}/%{name}/samples/dot-cqfdrc

%changelog
* Thu Jun 26 2025 Gaël PORTAY <gael.portay@gmail.com>
- Initial release.
