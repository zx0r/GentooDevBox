function ssh_agent --description "Start and manage SSH agent"
    set -l SSH_ENV "$HOME/.ssh/ssh-agent.env"

    # Check if the SSH agent environment file exists
    if test -f $SSH_ENV; and test -z "$SSH_AGENT_PID"
        source $SSH_ENV >/dev/null
    end

    # If the SSH agent is not running, start it
    if test -z "$SSH_AGENT_PID"
        eval (ssh-agent -c) >$SSH_ENV
        chmod 600 $SSH_ENV
        echo "SSH agent started."
    else
        echo "Using existing SSH agent."
    end

    # Add SSH keys
    set -l SSH_KEYS (fd '^id_' $HOME/.ssh --type f --exclude '*.pub')
    for KEY in $SSH_KEYS
        ssh-add $KEY
    end
end

# Automatically start the ssh-agent on shell initialization
ssh_agent

# function ssh_agent_is_started -d "check if ssh agent is already started"
#     if begin
#             test -f $SSH_ENV; and test -z "$SSH_AGENT_PID"
#         end
#         source $SSH_ENV >/dev/null
#     end
#
#     if test -z "$SSH_AGENT_PID"
#         return 1
#     end
#
#     ps -ef | grep $SSH_AGENT_PID | grep -v grep | grep -q ssh-agent
#     return $status
# end
#
# function ssh_agent_start -d "start a new ssh agent"
#     ssh-agent -c | sed 's/^echo/#echo/' >$SSH_ENV
#     chmod 600 $SSH_ENV
#     source $SSH_ENV >/dev/null
#     true # suppress errors from setenv, i.e. set -gx
# end
#
# function fish_ssh_agent --description "Start ssh-agent if not started yet, or uses already started ssh-agent."
#     if test -z "$SSH_ENV"
#         set -xg SSH_ENV $HOME/.ssh/ssh-agent.env
#     end
#
#     if not ssh_agent_is_started
#         ssh_agent_start
#     end
# end

# Automatically start the ssh-agent on shell initialization
# fish_ssh_agent
