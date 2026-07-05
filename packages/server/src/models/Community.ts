import {BaseEntity, Column, Entity, PrimaryGeneratedColumn} from 'typeorm';
import {Field, ID, ObjectType} from 'type-graphql';

@Entity({
  name: 'communities'
})
@ObjectType()
export class Community extends BaseEntity {
  @Field(() => ID)
  @PrimaryGeneratedColumn()
  id: number;

  @Field(() => String)
  @Column({name: 'communityName'})
  name: string;

  @Field(() => String)
  @Column({name: 'communityTag'})
  tag: string;

  @Field(() => String)
  @Column()
  channel: string;

  @Field(() => String)
  @Column()
  language: string;

  @Field(() => String)
  @Column()
  tank: string;

  @Field()
  @Column({type: 'int'})
  active: boolean;

  @Field(() => String)
  @Column()
  timezone: string;

  @Field()
  @Column({name: 'isHQ', type: 'int'})
  hq: boolean;

  @Field()
  @Column({name: 'isAS', type: 'int'})
  as: boolean;

  @Field()
  @Column({name: 'isVG', type: 'int'})
  vg: boolean;

}
