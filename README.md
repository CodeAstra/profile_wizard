# ProfileWizard
Short description and motivation.

## Usage
The following snippet defines a profile_wizard with the content accessible to `User` model via `info` attribute. The `info` has two steps: `step1` and `step2` with human readable titles `First Part` and `Second Part` respectively.

```ruby
class User
  profile_wizard :info, {
    step1: {
      title: 'First Part',
      required: true,
      questions: {
        name: {
          title: 'Name', # This is redundant, as the title can be inferred from key by humanizing it.
          type: :string,
          placeholder: 'John Doe',
          hint: 'Name as in passport'
        },
        gender: {
          type: :select,
          options: %w[Male Female]
        }
      }
    },
    step1: {
      title: 'Second Part',
      questions: {
        contact: {
          title: 'Email',
          type: :email
        },
        department: {
          title: 'Department',
          type: :select,
          options: {
            'Engineering' => 'Engineering & IT',
            'HR' => 'Human Resource'
          },
          default: 'HR'
        }
      }
    }
  }
end
```

### Section Schema
The profile wizard has several sections/steps. Each section is defined by a key value pair.

The keys are symbols; Please keep them unique and DO NOT change them. Changing the keys would lose all the answers of the section. In the example above, `step1` and `step2` are the keys for the sections.

The details the section are define by a hash with the schema below:

| Key | Explanation |
| --- | ----------- |
| `title` | A human readable string. This is shown as the heading of the section.<br>When the title is not provided, the title will be guessed by humanizing the key. |
| `required` | Setting this to true will make all the questions in the section to be required.<br>Allowed Values: `true`, `false` |
| `questions` | List of questiosn defined as a hash, the keys being unique identifiers for each question and the calue being another hash with the question schema |

### Question Schema
Each section has several questions. Each question is defined by a key value pair.

The keys are symbols; Please keep them unique and DO NOT change them. Changing the keys would lose all the answers of the question. In the example above, `name`, `gender`, `contact`, `department` are the keys for the questions.

The details of each question are define by a hash with the schema below:

| Key | Explanation | Default Value |
| --- | ----------- | --------------|
| `title` | A human readable string. This is shown as the label of the associated form field.<br>When the title is not provided, the title will be guessed by humanizing the key | N/A |
| `type` | The type of the HTML form field that need to be rendered.<br>Allowed Values: `:checkbox`, `:date`, `:email`, `:file`, `:number`, `:password`, `:select`, `:string`, `:tel`, `:text` | `:string` |
| `placeholder` | The placeholder value of the input field | N/A |
| `required` | Defines if the question is required, or not. The value define dhere overrides the value defined at section level, if any.<br>Allowed Values: `true`, `false`. | N/A |
| `hint` | A hint shown below the input area | N/A |
| `default` | The default initial value | N/A |
| `options` | The options to be shown, in case the question `type` is either `:select` or `:checkbox`.<br>The value is a hash, with both keys and values as strings. The keys of the hash would be the values of the `option` and the values of the hash will be the content of the `option` tag.<br>In case the key and values are same for all the options, you can just pass in an array of strings. | `{}` |

### Question Groups
You can optionally group a set of questions within a section using `question_groups`. These will be displayed as fieldsets in HTML.

```ruby
class User
  profile_wizard :info, {
    address: {
      title: 'Address',
      question_groups: {
        permanent: {
          title: 'Permanent Address',
          questions: {
            line_1: { type: :string },
            line_2: { type: :string },
            city: { type: :string },
            state: { type: :string },
            postal_code: { type: :string },
          }
        },
        temporary: {
          title: 'Temporary Address',
          questions: {
            line_1: { type: :string },
            line_2: { type: :string },
            city: { type: :string },
            state: { type: :string },
            postal_code: { type: :string },
          }
        }
      }
    }
  }
end
```

## Front-end Engine
This gem only handles the schema definition and the database handling at the back-end. You will need to use a front-end engine to work with _profile_wizard_ gem. Alternatively, you could write your own HTML to submit the data in the required format.

We officially support [profile_wizard_bootstrap](https://github.com/CodeAstra/profile_wizard_bootstrap) rails engine that seemlessly works using Bootstrap 4. We are working on an engine with React support and will release it soon.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'profile_wizard'
gem 'profile_wizard_bootstrap' # Optional
```

The inclusion of the gem `profile_wizard_bootstrap` is optional as explained in the [Front-end Engine](#front-end-engine) section above.

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install profile_wizard
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
