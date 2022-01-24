# Api da base de dados
Ao iniciar o backdev, uma novo servidor é criado localmente com endpoints para consumo da api da base de dados. Esta api permite interagir com a base de dados utilizando a convensão REST.



## Listar bases de dados

:::: code-group
::: code-group-item Javascript
```js

fetch("http://127.0.0.1:3011/databases?server=<servidor>&user=<utilizador>&password=<senha>&database=<Base de dados>")
.then(function(response) {
    return(response);
})

```
:::
::: code-group-item C#
```csharp
    using (HttpClient client = new HttpClient())
    {
        using (HttpResponseMessage res = await client.GetAsync("http://127.0.0.1:3011/databases?server=<servidor>&user=<utilizador>&password=<senha>&database=<Base de dados>"))
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


::: tip ONDE:



:::

