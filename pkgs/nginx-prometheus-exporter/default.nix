# This file was generated by GoReleaser. DO NOT EDIT.
# vim: set ft=nix ts=2 sw=2 sts=2 et sta
{
system ? builtins.currentSystem
, lib
, fetchurl
, installShellFiles
, stdenvNoCC
}:
let
  shaMap = {
    i686-linux = "1650qi869dcliran5f0523wcnc06yp64vfh8lrpyvhcw4s3cmcay";
    x86_64-linux = "1b975mxl6gf7ljar0ibxcsvvzy32gip5l7zm2isxlsqy50rd69sf";
    armv6l-linux = "10jyjdq507ypkygwyl10cwm2a3yxrhl5nw9q60qwyvmg9z1gg4d0";
    armv7l-linux = "1z1i995wrcbxmpw8ps9x3swi1nh31f0hl7cdrggp0i33ffliy0y0";
    aarch64-linux = "1z8qwgymmk19k3y922pnkc5fkzy53m4zjmc67k5mkxpkv20dg367";
    x86_64-darwin = "0ici6gb8nlqp9jqhfjlaxlcpwzb9wyy88z36hzlpi7aibglcgm62";
    aarch64-darwin = "102svfy37m2ss4x22k6qd6bbilzjnx0wmzlk4ii08fngmcgdd7yq";
  };

  urlMap = {
    i686-linux = "https://github.com/nginxinc/nginx-prometheus-exporter/releases/download/v1.3.0/nginx-prometheus-exporter_1.3.0_linux_386.tar.gz";
    x86_64-linux = "https://github.com/nginxinc/nginx-prometheus-exporter/releases/download/v1.3.0/nginx-prometheus-exporter_1.3.0_linux_amd64.tar.gz";
    armv6l-linux = "https://github.com/nginxinc/nginx-prometheus-exporter/releases/download/v1.3.0/nginx-prometheus-exporter_1.3.0_linux_armv6.tar.gz";
    armv7l-linux = "https://github.com/nginxinc/nginx-prometheus-exporter/releases/download/v1.3.0/nginx-prometheus-exporter_1.3.0_linux_armv7.tar.gz";
    aarch64-linux = "https://github.com/nginxinc/nginx-prometheus-exporter/releases/download/v1.3.0/nginx-prometheus-exporter_1.3.0_linux_arm64.tar.gz";
    x86_64-darwin = "https://github.com/nginxinc/nginx-prometheus-exporter/releases/download/v1.3.0/nginx-prometheus-exporter_1.3.0_darwin_amd64.tar.gz";
    aarch64-darwin = "https://github.com/nginxinc/nginx-prometheus-exporter/releases/download/v1.3.0/nginx-prometheus-exporter_1.3.0_darwin_arm64.tar.gz";
  };
in
stdenvNoCC.mkDerivation {
  pname = "nginx-prometheus-exporter";
  version = "1.3.0";
  src = fetchurl {
    url = urlMap.${system};
    sha256 = shaMap.${system};
  };

  sourceRoot = ".";

  nativeBuildInputs = [ installShellFiles ];

  installPhase = ''
    mkdir -p $out/bin
    cp -vr ./nginx-prometheus-exporter $out/bin/nginx-prometheus-exporter
    installManPage ./manpages/nginx-prometheus-exporter.1.gz
    installShellCompletion ./completions/*
  '';

  system = system;

  meta = {
    description = "NGINX Prometheus Exporter for NGINX and NGINX Plus";
    homepage = "https://github.com/nginxinc/nginx-prometheus-exporter";
    license = lib.licenses.asl20;

    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];

    platforms = [
      "aarch64-darwin"
      "aarch64-linux"
      "armv6l-linux"
      "armv7l-linux"
      "i686-linux"
      "x86_64-darwin"
      "x86_64-linux"
    ];
  };
}
