# Owlready2 Parallel ontology reasoning

This example shows how to reason more than one ontology at the same time using
the subprocess module.

## Environment Variables

You can set the following environment variables to change the behavior of the
script:

- `JAVA_MEM` - The amount of memory allocated to the Java Virtual Machine.
  Default is `2048`.

- `MAX_SUBPROCESS` - The maximum number of subprocesses to run at the same time.
  Default is `1`.

## How to Use

You can either use Docker or install the requirements manually.

### Using Docker

Firstly, put the ontologies you want to reason in a folder.

You can use following command to pull and run the Docker image:

```bash
docker run -it --rm -v /path/to/datafolder:/app/data -v /path/to/resultfolder:/app/results -v ghcr.io/ensaremirerol/owlready2-example:latest
```

On Docker you can set the environment variables using the `-e` flag.

You can see an example valid command below:

```bash
docker run -it --rm -v $(pwd)/data:/app/data -v $(pwd)/results:/app/results -e JAVA_MEM=4096 -e MAX_SUBPROCESS=2 ghcr.io/ensaremirerol/owlready2-example:latest
```

### Manual Installation

1. Optional: Create a virtual environment and activate it.

   - On Windows:

     ```bash
     python -m venv .venv
     .venv\Scripts\activate
     ```

   - On Linux or MacOS:

     ```bash
     python3 -m venv .venv
     source .venv/bin/activate
     ```

2. Install the requirements:

   ```bash
   pip install -r requirements.txt
   ```

#### How to Run

First place the ontologies you want to validate in the `data` folder.

You can use following formats: `.ttl`, `.xml`, `.owl`.

> **Note**: You can easily extend the supported formats by modifying the line 52
> in the `reasoner.py` file.
>
> Just don't forget that the `owlready2` does not support all the formats. In
> this case, you will need to convert the ontology to a supported format using
> `rdflib` (see line 58). All files must be moved to the `temp` folder.

> **Warning**: Contents of the `temp` folder deleted before each run.

Then run the following command:

> **Note**: If you are using virtual environment, don't forget to activate it.
>
> On Windows:
>
> ```bash
> .venv\Scripts\activate
> ```
>
> Or on Linux or MacOS:
>
> ```bash
> source .venv/bin/activate
> ```

```bash
python reasoner.py
```

You will see the output of the reasoning process in the console and results will
be saved in the `results` with their timestamps.
