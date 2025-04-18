alias GradingClient.Answer

to_answers = fn module_name, answers ->
  Enum.map(answers, fn data ->
    %Answer{
      module_id: module_name,
      question_id: data.question_id,
      answer: data.answer,
      help_text: data[:help_text]
    }
  end)
end

owasp_questions = [
  %{
    question_id: 1,
    answer: :entry_granted_op2,
    help_text: "Research MD5 Rainbow Tables"
  },
  %{
    question_id: 2,
    answer: :plug,
    help_text: "Check the changelog for the next minor or major release of each option."
  }
]

sdlc_questions = [
  %{
    question_id: 1,
    answer: "some-secret-password",
    help_text: "Use System.get_env/1 to get the password from the environment variable."
  }
]

graphql_questions = [
  %{
    question_id: 1,
    answer: :c,
    help_text: "Read the first paragraph of this livebook again!"
  },
  %{
    question_id: 2,
    answer: :a,
    help_text: "Read the first paragraph of this livebook again!"
  }
]

elixir_security_questions = [
  %{
    question_id: 1,
    answer: %ArgumentError{
      message:
        "errors were found at the given arguments:\n\n  * 1st argument: not an already existing atom\n"
    },
    help_text: "Read the Prevention section above."
  },
  %{
    question_id: 2,
    answer: %BadBooleanError{
      term: :access_denied,
      operator: :or
    },
    help_text: "Read the Prevention section above."
  },
  %{
    question_id: 3,
    answer: :private,
    help_text: "Read the documentation for :ets.new/2"
  }
]

cookie_security_questions = [
  %{
    question_id: 1,
    answer: {
      %{value: <<0, 42>>, path: "/", secure: true, http_only: true, same_site: "Strict"},
      "__Host"
    },
    help_text: "Read the section about the __Host prefix."
  }
]

antipatterns_questions = [
  %{
    question_id: 1,
    answer: :c,
    help_text: "Look-up the pseudocode for each algorithm."
  }
]

List.flatten([
  to_answers.(OWASP, owasp_questions),
  to_answers.(SDLC, sdlc_questions),
  to_answers.(GRAPHQL, graphql_questions),
  to_answers.(ELIXIR_SECURITY, elixir_security_questions),
  to_answers.(COOKIE_SECURITY, cookie_security_questions),
  to_answers.(ANTIPATTERNS, antipatterns_questions)
])
