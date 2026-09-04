{   stdenv,
    gnutls,
    cmake,
    pkg-config,
    doxygen,
    graphviz,
    exim,
    gsasl,
}:
stdenv.mkDerivation {
    name = "vmime";
    version = "0.9.2";
    src = ./.;
    buildInputs = [
        gnutls
        gnutls.dev
        exim
        gsasl
    ];
    nativeBuildInputs = [
        cmake
        pkg-config
        doxygen
        graphviz
    ];
    cmakeFlags = [
        "-DVMIME_SENDMAIL_PATH=${exim}/bin/sendmail"
    ];
}
