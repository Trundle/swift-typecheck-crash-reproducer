public enum Either<LeftType, RightType> {
           case Left(LeftType)
           case Right(RightType)
}

public typealias Result<In, Out> = Either<(In, String), (In, Out)>
