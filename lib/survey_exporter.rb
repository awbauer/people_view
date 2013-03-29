class SurveyExporter
  attr_reader :survey, :token
  def initialize(survey, token)
    @survey = survey
    @token = token
  end

  def export
    token.post("/api/v1/sites/#{survey.site_slug}/pages/surveys", body: parameters.to_json, headers: json_headers)
  end

  private

  def parameters
    {
      survey: survey_presenter.to_hash
    }
  end

  def survey_presenter
    NationBuilder::SurveyPresenter.new(survey)
  end

  def json_headers
    { "Content-Type" => "application/json", "Accept" => "application/json" }
  end
end

module NationBuilder
  class SurveyPresenter
    attr_reader :survey
    def initialize(survey)
      @survey = survey
    end

    def to_hash
      {
        status: survey.status,
        name: survey.name,
        slug: survey.slug,
        site_slug: survey.site_slug,
        questions: survey.questions.map { |question| QuestionPresenter.new(question).to_hash }
      }
    end
  end

  class QuestionPresenter
    attr_reader :question
    def initialize(question)
      @question = question
    end

    def to_hash
      {
        type: question.kind,
        status: question.status,
        slug: question.slug,
        prompt: question.prompt,
        choices: possible_responses_hash
      }
    end

    def possible_responses_hash
      question.possible_responses.map { |possible_response| PossibleResponsePresenter.new(possible_response).to_hash }
    end
  end

  class PossibleResponsePresenter
    attr_reader :possible_response
    def initialize(possible_response)
      @possible_response = possible_response
    end

    def to_hash
      {
        name: possible_response.name,
        feedback: possible_response.feedback
      }
      # feedback string in this hash if wanted
    end
  end
end
