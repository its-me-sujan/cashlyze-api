from django.views.decorators.cache import never_cache
from django.views.generic import TemplateView

# Serve Vue Application
index_view = never_cache(TemplateView.as_view(template_name="index.html"))

# Serve robot.txt from vue
robots = never_cache(TemplateView.as_view(template_name="robots.txt"))
manifest = never_cache(TemplateView.as_view(template_name="manifest.json"))
favicon = never_cache(
    TemplateView.as_view(template_name="favicon.png", content_type="image/png")
)
service_worker = never_cache(
    TemplateView.as_view(
        template_name="service-worker.js", content_type="text/javascript"
    )
)
