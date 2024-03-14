import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/features/weather/domain/model/weather.dart';

part 'weather_dto.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: false)
class WeatherInfoDto extends WeatherInfo with EquatableMixin {
  const WeatherInfoDto({
    required this.weatherDto,
    required this.mainDto,
  }) : super(weather: weatherDto, main: mainDto);

  @JsonKey(name: 'weather')
  final List<WeatherDto> weatherDto;

  @JsonKey(name: 'main')
  final TemperatureInfoDto mainDto;

  factory WeatherInfoDto.fromJson(Map<String, dynamic> json) {
    return _$WeatherInfoDtoFromJson(json);
  }

  @override
  List<Object?> get props => [super.props];
}

@JsonSerializable(createToJson: false)
class WeatherDto extends Weather with EquatableMixin {
  const WeatherDto({
    required super.main,
    required super.description,
  });

  factory WeatherDto.fromJson(Map<String, dynamic> json) {
    return _$WeatherDtoFromJson(json);
  }

  @override
  List<Object?> get props => [super.props];
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class TemperatureInfoDto extends TemperatureInfo with EquatableMixin {
  const TemperatureInfoDto({
    required super.temp,
    required super.feelsLike,
  });

  factory TemperatureInfoDto.fromJson(Map<String, dynamic> json) {
    return _$TemperatureInfoDtoFromJson(json);
  }

  @override
  List<Object?> get props => [super.props];
}
