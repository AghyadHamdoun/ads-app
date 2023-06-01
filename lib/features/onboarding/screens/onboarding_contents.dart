class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "إعلانك صار أسهل",
    image: "assets/images/boarding/create.png",
    desc: "مع تطبيق إعلاني يمكن للمؤثرين وصناع المحتوى من أصحاب الخبرة والموثوقية الإطلاع عليه وتقديم عروض تنفيذ الإعلان بشكل مباشر",
  ),
  OnboardingContents(
    title: "لا لعناء البحث ولا الوسطاء",
    image: "assets/images/boarding/search.png",
    desc:
    "الجميع في تطبيق واحد، كل ما عليك هو الإختيار الأمثل لنشاطك التجاري",
  ),
  OnboardingContents(
    title: "سهولة الوصول",
    image: "assets/images/boarding/task-list.png",
    desc:
    "تطبيقنا يوفر لك العديد من المؤثرين ليمكنك من اختيار المؤثر المناسب لنشاطك التجاري",
  ),
  OnboardingContents(
    title: "ضمان وشفافية",
    image: "assets/images/boarding/finish.png",
    desc:
    "يضمن لك التطبيق الوصول الحقيقي للمؤثر دون وسطاء مجهولين",
  ),
  OnboardingContents(
    title: "خيارات متعددة",
    image: "assets/images/boarding/paid.png",
    desc:
    "يتيح لك التطبيق العديد من الخيارات لطرق الدفع، اليات الإعلان للمؤثر، ضمان حصولك على نتائج واضحه",
  ),
];