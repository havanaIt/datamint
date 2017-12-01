FROM ocaml/opam:debian-stable_ocaml-4.04.0

RUN sudo apt-get install -qq -yy m4 zlib1g-dev libev-dev librdkafka-dev && \
    sudo apt-get install -qq -yy libssl-dev pkg-config && \
    sudo apt-get install -qq -yy libkyotocabinet-dev

RUN sudo -u opam sh -c "opam install -y jbuilder oUnit" && \
    sudo -u opam sh -c "opam install -y cmdliner conf-libev cohttp-lwt-unix kafka kyotocabinet lambda-term lwt ocaml-migrate-parsetree ppx_deriving ppx_driver ppx_sexp_conv sexplib websocket-lwt yojson"

RUN sudo -u opam sh -c "git clone https://github.com/didier-wenzek/datamint" && \
    sudo -u opam sh -c "opam config exec -- make -C datamint install"
 
EXPOSE 8000
EXPOSE 8001

ENTRYPOINT [ "opam", "config", "exec", "--" ]

CMD [ "bash" ]

