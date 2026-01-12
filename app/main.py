import sys
from awsglue.utils import getResolvedOptions
from awsglue.context import GlueContext
from pyspark.context import SparkContext

args = getResolvedOptions(
    sys.argv,
    ['JOB_NAME', 'database', 'tabela_origem', 'tabela_destino']
)

sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session

# Leitura da tabela existente no Glue Catalog
df = spark.table(f"{args['database']}.{args['usuarios']}")

# Transformação simples (exemplo)
df_filtrado = df.filter(df.idade >= 18)

# Escrita na tabela de destino (já criada)
df_filtrado.write.mode("overwrite").saveAsTable(
    f"{args['database']}.{args['tabela_destino']}"
)
