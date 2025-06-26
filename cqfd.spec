Name: cqfd
Version: 5.7.0
Release: 1
Summary: A tool to wrap commands in controlled Docker containers

License: GPLv3+
URL: https://github.com/savoirfairelinux/cqfd
Source0: v%{version}.tar.gz

BuildArch: noarch
BuildRequires: make
BuildRequires: pkgconfig(bash-completion)
Requires: bash
Requires: docker

%description
Run commands in the current directory within a container defined in a per-project config file.

%prep:

%build:

%install
make DESTDIR=%{buildroot}

%files
%{_bindir}/cqfd
%{_datadir}/bash-completion/completions/%{name}
%doc %{_datadir}/doc/cqfd/AUTHORS
%doc %{_datadir}/doc/cqfd/CHANGELOG.md
%doc %{_datadir}/doc/cqfd/README.md
%license %{_datadir}/doc/cqfd/LICENSE
%dir %{_datadir}/%{name}/samples

%changelog
* Thu Jun 26 2025 Gaël PORTAY <gael.portay@gmail.com>
- Initial release
