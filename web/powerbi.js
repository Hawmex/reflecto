import { PowerBIEmbed } from "https://esm.sh/powerbi-client-react@1.4.0";
import ReactDOM from "https://esm.sh/react-dom@18.3.1";
import React from "https://esm.sh/react@18.3.1";
import PowerBIClient from "https://esm.sh/v135/powerbi-client@2.23.1";

const reportConfigResponse = await fetch(
  "https://aka.ms/CaptureViewsReportEmbedConfig"
);

const reportConfig = await reportConfigResponse.json();

window.renderPowerBI = (id) => {
  ReactDOM.render(
    React.createElement(PowerBIEmbed, {
      embedConfig: {
        type: "visual",
        embedUrl: reportConfig.EmbedUrl,
        tokenType: PowerBIClient.models.TokenType.Embed,
        accessToken: reportConfig.EmbedToken.Token,
        pageName: "ReportSection600dd9293d71ade01765",
        visualName: "VisualContainer6",
      },
    }),
    document.getElementById(id)
  );
};
