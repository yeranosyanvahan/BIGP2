from flow import FLOW
import config

if __name__ == '__main__':
    flow = FLOW(config, "../docs/raw_data_source.xlsx")
    flow.execute()

