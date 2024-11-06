function openai
    # using llm. same dealio as above
    if test -z "$argv[1]"
        llm chat --continue -m gpt-4o
    else
        llm prompt -m gpt-4o "$argv" && echo "⬇️… and now rendered…⬇️" && llm logs -r | glow
    end
end

function gemi
    # using https://github.com/simonw/llm-gemini and llm
    # no args? chat.  otherwise use prompt, and allow unquoted stuff to work too
    #    gemi
    #    gemi tell me a joke      
    #    gemi "tell me a joke"
    if test -z "$argv[1]"
        # no markdown parsing here without some real fancy stuff. because you dont want to send to markdown renderer (glow) inbetween backticks, etc.
        llm chat --continue -m gemini-1.5-pro-latest
    else
        llm prompt -m gemini-1.5-pro-latest "$argv" && echo "⬇️… and now rendered…⬇️" && llm logs -r | glow
    end
end
