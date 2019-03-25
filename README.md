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
          title: 'Name',
          type: :string,
          placeholder: 'John Doe',
          hint: 'Name as in passport'
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
| `title` | A human readable string. This is shown as the heading of the section. |
| `required` | Setting this to true will make all the questions in the section to be required.<br>Allowed Values: `true`, `false` |
| `questions` | List of questiosn defined as a hash, the keys being unique identifiers for each question and the calue being another hash with the question schema |

### Question Schema
Each section has several questions. Each question is defined by a key value pair.

The keys are symbols; Please keep them unique and DO NOT change them. Changing the keys would lose all the answers of the question. In the example above, `name`, `contact`, `department` are the keys for the questions.

The details of each question are define by a hash with the schema below:

| Key | Explanation | Default Value |
| --- | ----------- | --------------|
| `title` | A human readable string. This is shown as the label of the associated form field | N/A |
| `type` | The type of the HTML form field that need to be rendered.<br>Allowed Values: `:checkbox`, `:date`, `:email`, `:file`, `:number`, `:password`, `:select`, `:string`, `:tel`, `:text` | `:string` |
| `placeholder` | The placeholder value of the input field | N/A |
| `required` | Defines if the question is required, or not. The value define dhere overrides the value defined at section level, if any.<br>Allowed Values: `true`, `false`. | N/A |
| `hint` | A hint shown below the input area | N/A |
| `default` | The default initial value | N/A |
| `options` | The options to be shown, in case the question `type` is either `:select` or `:checkbox`.<br>The value is a hash, with both keys and values as strings. The keys of the hash would be the values of the `option` and the values of the hash will be the content of the `option` tag. | `{}` |


## Installation
Add this line to your application's Gemfile:

```ruby
gem 'profile_wizard'
```

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
