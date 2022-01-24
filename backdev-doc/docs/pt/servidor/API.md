# Api da base de dados
Ao iniciar o backdev, uma novo servidor é criado localmente com endpoints para consumo da api da base de dados. Esta api permite interagir com a base de dados utilizando a convensão REST.

`EXEMPLO:`
:::: code-group
::: code-group-item Javascript
```js

fetch("http://127.0.0.1:3011/databases").then(function(response) {
    return(response);
})

```
:::
::: code-group-item C#
```csharp
    using (HttpClient client = new HttpClient())
    {
        using (HttpResponseMessage res = await client.GetAsync("http://127.0.0.1:3011/databases"))
        {
            using (HttpContent content = res.Content)
            {
                string data = await content.ReadAsStringAsync();
                var dataObj = JObject.Parse(data);
                Console.WriteLine(dataObj);
            }
        }
    }

```
:::
::: code-group-item Result
```json
[
	{
		"name": "LLCars"
	},
	{
		"name": "REALHOPE"
	},
	{
		"name": "REALHOPE_PROD"
	},
	{
		"name": "MASI"
	},
	{
		"name": "MASI_TESTES"
	},
	{
		"name": "SGV"
	}
]
```
:::
::::