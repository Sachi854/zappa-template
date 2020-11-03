# zappa template
My zappa template and my note.  

https://github.com/Miserlou/Zappa

# Table of Contents  
- [How to use template](#how-to-use-template)  
- [How to use zappa](#how-to-use-zappa)  
  * [Prerequisite environment](#prerequisite-environment)
  * [Initialization](#initialization)  
  * [Test](#test)
  * [Commands](#commands)  
  * [Basic directory structure](#basic-directory-structure)
  * [Basic settings file structure](#basic-settings-file-structure)
    + [json](#json)
    + [YAML](#yaml)

# How to use template  

1. Clone template.

```
$ git clone https://github.com/Sachi854/zappa-template.git
```

2. Rename file name and text. 

# How to use zappa  

## Prerequisite environment
- Python  
- venv  
- Have a AWS account
- Set a "~/.aws/config" file

## Initialization  

1. Make project dir.

```
$ mkdir <zappa_project_dir>
$ cd <zappa_project_dir>
```

2. Enable venv.
```
$ python3 -m venv venv
$ source venv/bin/activate
```

3. Install zappa and flask and other package.
```
$ pip install flask
$ pip install zappa
$ pip install numpy
```

----

Or, use ``gen_zappa_env.sh``
```
$ . ./gen_zappa_env.sh
```

## Test

```
$ flask run
```

----

(Option)Out put package list.
```
$ pip freeze > requirements.txt
```

## Commands  

There are other commands. If you want to know other commands, you should browse [official document](https://github.com/Miserlou/Zappa).

### init

- Initialization 

```
$ zappa init
```
### deploy  

- "<production_name>" is in the zappa_settings.json.
- Becomes "(API gateway -> EventBridge) -> lambda" when deployed.

```
$ zappa deploy <production_name>
```

or

```
$ zappa deploy <production_name> -s custom_settings.yml
```

### update  

- Update new python code.

```
$ zappa update <production_name>
```

### rollback  

- Rollback to the version deployed 3 versions ago.

```
$ zappa rollback <production_name> -n 3
```

### undeploy  

- Undeploy

```
$ zappa undeploy <production_name>
```

## Basic directory structure  

```
└── zappa_project
    ├── app.py
    ├── venv
    │   ├── bin
    │   └── lib
    └── zappa_settings.json
```

## Basic settings file structure  

### json  

```javascript
{
    // production_name
    "dev": {
        // Path of flask object. 
        // Example: [app.py ->In the file:app_obj = Flask(_name_)] => app.app_obj
        "app_function": "app.app_obj",
        // Profile name of .aws/congfig
        "profile_name": "default",
        // Project name.
        "project_name": "zappa-flask-app",
        // Runtime
        "runtime": "python3.6",
        // Name of s3 bucket. If you haven't made it, make it.
        "s3_bucket": "s3-bucket-unique-name-*****",
        // Region
        "aws_region": "ap-northeast-1"
    }
}
```

### YAML  

```yml
dev:
    app_function: app.app_obj
    project_name: zappa-flask-app
    runtime: python3.6
    s3_bucket: s3-bucket-unique-name-*****
    aws_region: ap-northeast-1
```
