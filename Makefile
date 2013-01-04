DEPS=./deps

%.beam: %.erl
	erlc -o test/ $<

all:$(DEPS)
	./rebar compile

$(DEPS):
	@mkdir -p $(DEPS)
	./rebar get-deps

etags:
	find . | grep ".*\.\(h\|hxx\|c\)" | xargs etags -f TAGS

clean:
	rebar clean
	rm -rf test/*.beam

distclean:
	rm -rf $(DEPS)
	rm -rf priv

test: all
	mkdir -p .eunit
	./rebar skip_deps=true eunit
	./rebar ct
